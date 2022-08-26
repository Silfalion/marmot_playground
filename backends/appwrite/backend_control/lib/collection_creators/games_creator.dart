import 'package:backend_control/constants/consts.dart';
import 'package:backend_control/utils/logger.dart';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:fpdart/fpdart.dart';

class GamesCreator {
  GamesCreator(this._db);

  final Databases _db;

  final String _imageIdAttName = 'imageId';
  final String _gameTitleAttName = 'gameTitle';
  final String _descriptionAttName = 'description';

 final String _collectionId = gameCollectionId;

  ///creates the game collection and if the creation is successful
  ///all its attributes
  Future<void> createGamesCollection() async {
    final matchCollectionCreation = TaskEither.tryCatch(
      () => _db.createCollection(
        collectionId: _collectionId,
        name: _collectionId,
        permission: 'document',
        read: ['role:all'],
        write: [],
      ),
      (error, stackTrace) {
        logger.d(stackTrace);
        return error;
      },
    );

    (await matchCollectionCreation.run()).fold(
      logger.d,
      (r) async {
        logger.d('CREATED GAME COLLECTION');
        await _createGamesAttributes().run();
      },
    );
  }

  ///creates the match status attribute
  TaskEither<Object, void> _createGamesAttributes() {
    return TaskEither<Object, void>.tryCatch(
      () async {
        //creates game title attribute
        await _db.createStringAttribute(
          collectionId: _collectionId,
          key: _gameTitleAttName,
          xrequired: true,
          array: false,
          size: 80,
        );

        //creates image id attribute
        await _db.createStringAttribute(
          collectionId: _collectionId,
          key: _imageIdAttName,
          xrequired: true,
          array: false,
          size: 20,
        );

        //creates game description attribute
        await _db.createStringAttribute(
          collectionId: _collectionId,
          key: _descriptionAttName,
          xrequired: false,
          array: false,
          size: 4096,
        );
      },
      (error, stackTrace) {
        logger.d(stackTrace);
        return error;
      },
    );
  }
}
