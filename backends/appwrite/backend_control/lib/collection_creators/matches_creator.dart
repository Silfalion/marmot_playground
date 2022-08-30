import 'package:backend_control/constants/consts.dart';
import 'package:backend_control/utils/logger.dart';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:fpdart/fpdart.dart';

enum MatchStatus { playing, cancelled, finished }

class MatchesCreator {
  MatchesCreator(this._db);

  final Databases _db;

  final String _listPlayersAttName = 'listPlayers';
  final String _matchStatusAttName = 'matchStatus';
  final String _playerOneMoveAttName = 'playerOneMove';
  final String _playerTwoMoveAttName = 'playerTwoMove';

  final _collectionId = matchCollectionId;

  ///creates the match collection and if the creation is successful
  ///all its attributes
  Future<void> createMatchesCollection() async {
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
        return error as AppwriteException;
      },
    );

    await (await matchCollectionCreation.run()).fold(
      (l) async {
        if (l.code == 409) {
          print('MATCH COLLECTION ALREADY EXISTS');
          await _createMatchesAttributes().run();
        } else {
          logger.d(l);
        }
      },
      (r) async {
        print('CREATED MATCH COLLECTION');
        await _createMatchesAttributes().run();
      },
    );
  }

  ///creates the match status attribute
  TaskEither<Object, void> _createMatchesAttributes() {
    return TaskEither<Object, void>.tryCatch(
      () async {
        //creates match status attribute
        await _db.createEnumAttribute(
          collectionId: _collectionId,
          key: _matchStatusAttName,
          xrequired: true,
          array: false,
          elements: MatchStatus.values.map((e) => e.name).toList(),
        );

        //creates players list attribute
        await _db.createStringAttribute(
          collectionId: _collectionId,
          key: _listPlayersAttName,
          xrequired: true,
          array: true,
          size: 20,
        );

        await _createPlayerOneMoveAttribute().run();
        await _createPlayerTwoMoveAttribute().run();
      },
      (error, stackTrace) {
        logger.d(stackTrace);
        return error;
      },
    );
  }

  TaskEither<Object, void> _createPlayerOneMoveAttribute() {
    return TaskEither.tryCatch(
      () async {
        await _db.createStringAttribute(
          collectionId: _collectionId,
          key: _playerOneMoveAttName,
          xrequired: false,
          array: false,
          size: 20,
        );
      },
      (error, stackTrace) => error,
    );
  }

  TaskEither<Object, void> _createPlayerTwoMoveAttribute() {
    return TaskEither.tryCatch(
      () async {
        await _db.createStringAttribute(
          collectionId: _collectionId,
          key: _playerTwoMoveAttName,
          xrequired: false,
          array: false,
          size: 20,
        );
      },
      (error, stackTrace) => error,
    );
  }
}
