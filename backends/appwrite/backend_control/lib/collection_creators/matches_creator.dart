import 'package:backend_control/constants/consts.dart';
import 'package:backend_control/utils/logger.dart';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:fpdart/fpdart.dart';

const String listPlayersAttName = 'listPlayers';
const String matchStatusAttName = 'matchStatus';

enum MatchStatus { playing, cancelled, finished }

class MatchesCreator {
  MatchesCreator(this.db);

  final Databases db;

  ///creates the match collection and if the creation is successful
  ///all its attributes
  Future<void> createMatchesCollection() async {
    final matchCollectionCreation = TaskEither.tryCatch(
      () => db.createCollection(
        collectionId: matchCollectionId,
        name: matchCollectionId,
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
        await db.createEnumAttribute(
          collectionId: matchCollectionId,
          key: matchStatusAttName,
          xrequired: true,
          array: true,
          elements: MatchStatus.values.map((e) => e.name).toList(),
        );


        //creates players list attribute
         await db.createStringAttribute(
          collectionId: matchCollectionId,
          key: listPlayersAttName,
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

  ///create the players list attribute
  TaskEither<Object, void> _createPlayersAtt() {
    return TaskEither<Object, void>.tryCatch(
      () async {
       
      },
      (error, stackTrace) {
        logger.d(stackTrace);
        return error;
      },
    );
  }
}
