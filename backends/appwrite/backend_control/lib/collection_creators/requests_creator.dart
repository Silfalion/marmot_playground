import 'package:backend_control/constants/consts.dart';
import 'package:backend_control/utils/logger.dart';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';
import 'package:fpdart/fpdart.dart';

const String playerIdAttName = 'playerId';

class RequestsCreator {
  RequestsCreator(this.db);

  final Databases db;

  ///creates the match collection and if the creation is successful
  ///all its attributes
  Future<void> createMatchRequestsCollection() async {
    final matchResult = TaskEither<Object, Collection>.tryCatch(
      () {
        return db.getCollection(collectionId: requetsCollectionId);
      },
      (error, stackTrace) {
        logger.d(stackTrace);
        return error;
      },
    );

    TaskEither<Object, void>? matchRequestsCollectionCreation;

    //tries to get the collection
    //if it doesn't exist, it assigns the task to create to matchCollectionCreation
    //otherwise it stays null and an error is printed
    (await matchResult.run()).fold(
      (l) {
        matchRequestsCollectionCreation = TaskEither.tryCatch(
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
      },
      logger.d,
    );

    (await matchRequestsCollectionCreation?.run())?.fold(
      logger.d,
      (r) async {
        logger.d('CREATED MATCH REQUESTS COLLECTION');
        (await _createPlayerIdAtt().run()).fold(logger.d, (r) => null);
      },
    );
  }

  ///creates the match status attribute
  TaskEither<Object, AttributeString> _createPlayerIdAtt() {
    return TaskEither<Object, AttributeString>.tryCatch(
      () {
        return db.createStringAttribute(
          collectionId: requetsCollectionId,
          key: playerIdAttName,
          xrequired: true,
          array: false,
          size: 1,
        );
      },
      (error, stackTrace) {
        logger.d(stackTrace);
        return error;
      },
    );
  }
}
