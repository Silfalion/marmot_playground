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
        return error;
      },
    );

    (await matchCollectionCreation.run()).fold(
      logger.d,
      (r) async {
        logger.d('CREATED MATCH COLLECTION');
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
      },
      (error, stackTrace) {
        logger.d(stackTrace);
        return error;
      },
    );
  }
}
