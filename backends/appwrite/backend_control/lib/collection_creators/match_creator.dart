import 'package:backend_control/constants/consts.dart';
import 'package:backend_control/utils/logger.dart';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';
import 'package:fpdart/fpdart.dart';

const String listPlayersAttName = 'listPlayers';
const String matchStatusAttName = 'matchStatus';

enum MatchStatus { playing, cancelled, finished }

class MatchCreator {
  MatchCreator(this.db);

  final Databases db;

  ///creates the match collection and if the creation is successful
  ///all its attributes
  Future<void> createMatchesCollection() async {
    final matchResult = TaskEither<Object, Collection>.tryCatch(
      () {
        return db.getCollection(collectionId: matchCollectionId);
      },
      (error, stackTrace) {
        logger.d(stackTrace);
        return error;
      },
    );

    TaskEither<Object, void>? matchCollectionCreation;

    //tries to get the collection
    //if it doesn't exist, it assigns the task to create to matchCollectionCreation
    //otherwise it stays null and an error is printed
    (await matchResult.run()).fold(
      (l) {
        matchCollectionCreation = TaskEither.tryCatch(
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
      },
      logger.d,
    );

    (await matchCollectionCreation?.run())?.fold(
      logger.d,
      (r) async {
        logger.d('CREATED MATCH COLLECTION');
        (await _createMatchStatusAtt().run()).fold(logger.d, (r) => null);
        (await _createPlayersAtt().run()).fold(logger.d, (r) => null);
      },
    );
  }

  ///creates the match status attribute
  TaskEither<Object, AttributeEnum> _createMatchStatusAtt() {
    return TaskEither<Object, AttributeEnum>.tryCatch(
      () {
        return db.createEnumAttribute(
          collectionId: matchCollectionId,
          key: matchStatusAttName,
          xrequired: true,
          array: true,
          elements: MatchStatus.values.map((e) => e.name).toList(),
        );
      },
      (error, stackTrace) {
        logger.d(stackTrace);
        return error;
      },
    );
  }

  ///create the players list attribute
  TaskEither<Object, AttributeString> _createPlayersAtt() {
    return TaskEither<Object, AttributeString>.tryCatch(
      () {
        return db.createStringAttribute(
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
}
