import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:appwrite_ruq_api/src/constants/appwrite.dart';
import 'package:appwrite_ruq_api/src/utils/logger.dart';
import 'package:fpdart/fpdart.dart';
import 'package:appwrite_ruq_api/src/models/models.dart' as localModels;

class AppwriteRuqApi {
  /// {@macro appwrite_ruq_api}
  AppwriteRuqApi(
    String endPoint,
    String projectId, {
    String databaseId = 'default',
  }) {
    _client.setEndpoint(endPoint).setProject(projectId);

    database = Databases(_client, databaseId: databaseId);

    account = Account(_client);
  }

  final Client _client = Client();

  ///Appwrite database service
  late Databases database;

  ///Appwrite authentification service
  late Account account;

  ///Realtime service
  late Realtime realtime;

  ///Stream used to expose a new opponent
  late Stream<localModels.User> opponentStream;

  ///finds a match opponent
  //TODO: change String to exception class
  Future<void> findMatch() async {
    final result = await makeMatchingRequest();
    result.fold(logger.d, (r) {
      logger.d('Succefully created a request.');

      const matchCreatedEvent =
          'databases.$databaseId.collections.$matchCollectionId.documents';

      //TODO: add checking the DB first in case the match was already created

      //subscribes to the list of documents in the collection id
      //for any new match created
      //we don't have to worry about being flooded with notifications
      //because each match has permissions for the 2 participants only
      //so we'll only receive notifications for new matches that include us
      opponentStream = realtime
          .subscribe([matchCreatedEvent])
          .stream
          .asyncExpand<localModels.User>((event) {
            if (event.payload.isNotEmpty) {
              if (event.events.contains('$matchCreatedEvent.create')) {
                return Stream.value(localModels.User.fromJson(event.payload));
              }
            }
            return null;
          });
    });
  }

  Future<Either<Object, void>> makeMatchingRequest() async {
    ///make matching request
    return TaskEither<Object, void>.tryCatch(
      () => database.createDocument(
        collectionId: 'requests',
        documentId: 'unique()',
        data: {'userId': 'userId'},
      ),
      (error, stackTrace) {
        return error;
      },
    ).run();
  }
}
