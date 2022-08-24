import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:appwrite_ruq_api/src/constants/appwrite.dart';
import 'package:appwrite_ruq_api/src/exceptions/request_exception/request_exception.dart';
import 'package:appwrite_ruq_api/src/utils/logger.dart';
import 'package:fpdart/fpdart.dart';
import 'package:appwrite_ruq_api/src/models/models.dart' as localModels;

///repository responsible for logging in the user and making matchmaking
///requests to the server
class MatchmakingRepository {
  /// {@macro appwrite_ruq_api}
  MatchmakingRepository();

  ///initial setup
  TaskEither<Exception, Unit> setup(
    String endPoint,
    String projectId, {
    String databaseId = 'marmot_playground_db',
  }) {
    _client.setEndpoint(endPoint).setProject(projectId);

    database = Databases(_client, databaseId: databaseId);

    account = Account(_client);

    realtime = Realtime(_client);

    return TaskEither<AppwriteException, Unit>.tryCatch(
      () async {
        session = Either.right(await account.createAnonymousSession());

        return unit;
      },
      (error, stackTrace) => error as AppwriteException,
    ).orElse<Exception>((l) {
      if (l.code == 401) {
        return TaskEither<Exception, Unit>.tryCatch(
          () async {
            session =
                Either.right(await account.getSession(sessionId: 'current'));
            return unit;
          },
          (error, stackTrace) => error as Exception,
        );
      }
      return TaskEither.fromEither(
        Either.fromOption(Option.of(unit), RequestServerException.new),
      );
    }).mapLeft<Exception>((l) => l);
  }

  final Client _client = Client();

  ///Appwrite database service
  late Databases database;

  ///Appwrite authentification service
  late Account account;

  ///Realtime service
  late Realtime realtime;

  ///Stream used to expose a new opponent
  StreamController<localModels.User?> opponentStream =
      StreamController.broadcast();

  ///Anonymous user created
  Either<Exception, Session?> session = Either.right(null);

  ///subscription to the request event
  RealtimeSubscription? _matchesSubscription;

  ///finds a match opponent 
  ///
  ///[timeOut] time in seconds which after the request is canceled
  Future<void> findMatch({int timeOut = 5}) async {
    await session.fold((l) => throw RepositoryNotSetup(), (r) async {
      const matchCreatedEvent =
          'databases.$databaseId.collections.$matchCollectionId.documents';

      // timer to stop the subscription if the wait time expires
      late Timer timer;

      //TODO: add checking the DB first in case the match was already created

      //subscribes to the list of documents in the collection id
      //for any new match created
      //we don't have to worry about being flooded with notifications
      //because each match has permissions for the 2 participants only
      //so we'll only receive notifications for new matches that include us

      _matchesSubscription = realtime.subscribe([matchCreatedEvent]);

      _matchesSubscription?.stream.listen((event) {
        if (event.payload.isNotEmpty) {
          if (event.events.contains('$matchCreatedEvent.*.create')) {
            opponentStream.add(localModels.User.fromJson(event.payload));
            timer.cancel();
          }
        }
      });

      opponentStream.onCancel = () {};

      final result = _makeMatchingRequest().orElse<Exception>(
        (l) {
          return TaskEither.tryCatch(
            () async {
              await _matchesSubscription?.close();

              opponentStream.add(null);
            },
            (error, stackTrace) => RequestNoMatchFoundException(),
          );
        },
      ).andThen(
        () => TaskEither.tryCatch(
          () async {
            timer = Timer(Duration(seconds: timeOut), () async {
              await _matchesSubscription?.close();
              opponentStream.add(null);
            });
          },
          (error, stackTrace) => RequestNoMatchFoundException(),
        ),
      );

      await result.run();
    });
  }

  ///makes the matchmaking request to the server 
  TaskEither<AppwriteException, void> _makeMatchingRequest() {
    ///make matching request
    return TaskEither<AppwriteException, void>.tryCatch(
      () => database.createDocument(
        collectionId: 'requests',
        documentId: 'unique()',
        data: {'playerId': session.getRight().getOrElse(() => null)?.userId},
      ),
      (error, stackTrace) {
        return error as AppwriteException;
      },
    );
  }
}
