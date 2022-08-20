import 'package:backend_control/utils/logger.dart';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';
import 'package:fpdart/fpdart.dart';

TaskEither<AppwriteException, void> checkCollectionExist(
  Databases db,
  String collectionId,
) {
  return TaskEither<AppwriteException, void>.tryCatch(
    () {
      return db.getCollection(collectionId: collectionId);
    },
    (error, stackTrace) {
      logger.d(stackTrace);
      return error as AppwriteException;
    },
  );
}
