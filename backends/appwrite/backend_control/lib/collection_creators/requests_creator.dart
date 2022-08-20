import 'package:backend_control/collection_creators/commong_methods.dart';
import 'package:backend_control/constants/consts.dart';
import 'package:backend_control/utils/logger.dart';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:fpdart/fpdart.dart';

const String playerIdAttName = 'playerId';

class RequestsCreator {
  RequestsCreator(this.db);

  final Databases db;

  ///creates the match collection and if the creation is successful
  ///all its attributes
  Future<void> createMatchRequestsCollection() async {
    final matchRequestsCollectionCreation = TaskEither<Object, void>.tryCatch(
      () => db.createCollection(
        collectionId: requetsCollectionId,
        name: requetsCollectionId,
        permission: 'collection',
        read: [],
        write: ['role:all'],
      ),
      (error, stackTrace) {
        logger.d(stackTrace);
        return error;
      },
    );

    (await matchRequestsCollectionCreation.run()).fold(
      logger.d,
      (r) async {
        logger.d('CREATED MATCH REQUESTS COLLECTION');
        await _createRequestsAtt().run();
      },
    );
  }

  ///creates the match status attribute
  TaskEither<Object, void> _createRequestsAtt() {
    return TaskEither<Object, void>.tryCatch(
      () async {
        //creates player id attribute
        await db.createStringAttribute(
          collectionId: requetsCollectionId,
          key: playerIdAttName,
          xrequired: true,
          array: false,
          size: 36,
        );
      },
      (error, stackTrace) {
        logger.d(stackTrace);
        return error;
      },
    );
  }
}
