import 'dart:async';
import 'dart:math';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:appwrite_ruq_api/src/constants/appwrite.dart';
import 'package:appwrite_ruq_api/src/exceptions/request_exception/request_exception.dart';
import 'package:appwrite_ruq_api/src/models/request/marmot_request.dart';
import 'package:appwrite_ruq_api/src/utils/logger.dart';
import 'package:fpdart/fpdart.dart';
import 'package:appwrite_ruq_api/src/models/models.dart' as localModels;

///repository responsible for logging in the user and making matchmaking
///requests to the server
class MatchmakingRepository {
  /// {@macro appwrite_ruq_api}
  MatchmakingRepository({Client? client}) : _client = client ?? Client();

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

  final Client _client;

  ///Appwrite database service
  late Databases database;

  ///Appwrite authentification service
  late Account account;

  ///Realtime service
  late Realtime realtime;

  ///Stream used to expose a new opponent
  StreamController<String?> opponentStream = StreamController.broadcast();

  ///Anonymous user created
  Either<Exception, Session?> session = Either.right(null);

  ///subscription to the request event
  RealtimeSubscription? _requestSubscription;

  ///finds a match opponent
  ///
  ///[timeOut] time in seconds which after the request is canceled
  Future<void> _hostGame({int timeOut = 5}) async {
    await session.fold((l) => throw RepositoryNotSetup(), (r) async {
      const requestedCreatedEvent =
          'databases.$databaseId.collections.$requetsCollectionId.documents';

      // timer to stop the subscription if the wait time expires
      late Timer timer;

      //TODO: add checking the DB first in case the match was already created

      //subscribes to the list of documents in the collection id
      //for any new match created
      //we don't have to worry about being flooded with notifications
      //because each match has permissions for the 2 participants only
      //so we'll only receive notifications for new matches that include us

      // _matchesSubscription?.stream.listen((event) {
      //   if (event.payload.isNotEmpty) {
      //     if (event.events.contains('$matchCreatedEvent.*.create')) {
      //       opponentStream.add(localModels.User.fromJson(event.payload).id);
      //       timer.cancel();
      //     }
      //   }
      // });

      final result = _makeMatchingRequest()
          .mapLeft<Exception>((l) => Exception())
          .flatMap(
            (r) => TaskEither.tryCatch(
              () async {
                //subscribe to the request
                _requestSubscription =
                    realtime.subscribe(['$requestedCreatedEvent.${r.$id}']);

                _requestSubscription?.stream.listen((event) {
                  if (event.payload.isNotEmpty) {
                    if (event.events.contains(requestedCreatedEvent)) {
                      opponentStream
                          .add(localModels.User.fromJson(event.payload).id);
                      timer.cancel();
                    }
                  }
                });

                timer = Timer(Duration(seconds: timeOut), () async {
                  await _requestSubscription?.close();
                  //cancels the request when time is up
                  await _cancelMatchRequest(r.$id).run();
                  opponentStream.add(null);
                });
              },
              (error, stackTrace) => RequestNoMatchFoundException(),
            ),
          )
          .orElse<Exception>(
        (l) {
          return TaskEither.tryCatch(
            () async {
              await _requestSubscription?.close();

              opponentStream.add(null);
              return null;
            },
            (error, stackTrace) => RequestNoMatchFoundException(),
          );
        },
      );

      await result.run();
    });
  }

  ///tries to find a match either through hosting or guesting
  Future<void> newFindMatch({int timeOut = 5}) async {
    final actualSession = session.getRight();

    if (actualSession.isSome()) {
      //randomizer to decided on host or guest and also for picking up
      //a document in case of guest

      final random = Random();

      //randomly decides if host or guest, could be improved by
      //fetching the list of requests to decide whether it should be a host or
      //or a guest
      final bool isHost;
      if (random.nextDouble() > 0.5) {
        isHost = true;
      } else {
        isHost = true;
      }

      //if host, creates a request and listens to it, cancels it if it times out

      if (isHost) {
        await _hostGame(timeOut: timeOut);
      }

      //if guest, go to a random host request, changes the write permissions
      //to add itself and the host only, then adds itself to the matched player
      //id

      else {
        final documentListOrNot = await _listOfRequests().run();

        documentListOrNot.fold(
          (l) => opponentStream.add(null),
          (r) async {
            if (r.total != 0) {
              //index of the selected document
              final selectedIndex = random.nextInt(r.total);

              final selectedRequest =
                  MarmotRequest.fromJson(r.documents[selectedIndex].data);

              final lockingResult = await _lockInRequest(
                r.documents[selectedIndex].$id,
                selectedRequest,
              ).flatMap((r) => _makeGameMatch(selectedRequest)).run();

              //IMPROVEMENT: currently this will throw an error if the doc we
              //tried to update was already locked by another player so there has
              //to be a loop to retry in that case
              //for that we need to check the returned exception as the problem
              //for not fulfilling the matching could be that there is a problem
              //with the query we're making or with the server itself
              lockingResult.fold(
                (l) => opponentStream.add(null),
                (r) => opponentStream.add(r.$id),
              );
            } else {
              opponentStream.add(null);
            }
          },
        );
      }
    } else {
      throw RequestCurrentUserNullException();
    }
  }

  ///creates a new game match
  TaskEither<AppwriteException, Document> _makeGameMatch(
    MarmotRequest request,
  ) {
    return TaskEither<AppwriteException, Document>.tryCatch(
      () => database.createDocument(
        collectionId: matchCollectionId,
        documentId: 'unique()',
        data: {
          'matchStatus': 'playing',
          'listPlayers': [],
        },
        write: [
          'user:${request.playerId}',
          'user:${session.getRight().getOrElse(() => null)?.userId}'
        ],
        read: [
          'user:${request.playerId}',
          'user:${session.getRight().getOrElse(() => null)?.userId}'
        ],
      ),
      (error, stackTrace) {
        return error as AppwriteException;
      },
    );
  }

  ///makes the matchmaking request to the server as host
  TaskEither<AppwriteException, Document> _makeMatchingRequest() {
    ///make matching request
    return TaskEither.tryCatch(
      () => database.createDocument(
        collectionId: requetsCollectionId,
        documentId: 'unique()',
        data: MarmotRequest(
          playerId: session.getRight().getOrElse(() => null)?.userId ?? '',
          status: RequestStatus.standby,
        ).toJson(),
        write: ['role:member'],
        read: ['role:member'],
      ),
      (error, stackTrace) {
        return error as AppwriteException;
      },
    );
  }

  ///cancels match in case the timer expired for example
  TaskEither<AppwriteException, Document> _cancelMatchRequest(
    String requestId,
  ) {
    ///make matching request
    return TaskEither.tryCatch(
      () => database.updateDocument(
        collectionId: requetsCollectionId,
        documentId: requestId,
        data: {'status': RequestStatus.cancelled.name},
      ),
      (error, stackTrace) {
        return error as AppwriteException;
      },
    );
  }

  ///fetches list of requests that are still in standby
  TaskEither<AppwriteException, DocumentList> _listOfRequests() {
    return TaskEither.tryCatch(
      () async => database.listDocuments(
        collectionId: requetsCollectionId,
        queries: [Query.equal('status', RequestStatus.standby.name)],
      ),
      (error, stackTrace) {
        return error as AppwriteException;
      },
    );
  }

  ///locks in the request for the match
  TaskEither<AppwriteException, Unit> _lockInRequest(
    String documentId,
    MarmotRequest request,
  ) {
    return TaskEither.tryCatch(
      () async {
        //updates the request document as follows
        //"close the door" of the request by changing it's read and write
        //values so that we can no longer write to it except for the
        //2 players but we also lock it by changing the request status to match
        await database.updateDocument(
          collectionId: requetsCollectionId,
          documentId: documentId,
          write: [
            'user:${request.playerId}',
            'user:${session.getRight().getOrElse(() => null)?.userId}'
          ],
          data: {
            'matchedPlayer': session.getRight().getOrElse(() => null)?.userId,
            'status': RequestStatus.matched.name
          },
        );

        return unit;
      },
      (error, stackTrace) {
        return error as AppwriteException;
      },
    );
  }
}
