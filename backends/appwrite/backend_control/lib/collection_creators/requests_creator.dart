import 'package:backend_control/collection_creators/commong_methods.dart';
import 'package:backend_control/constants/consts.dart';
import 'package:backend_control/utils/logger.dart';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:fpdart/fpdart.dart';

enum RequestStatus {
  standby,
  cancelled,
  matched,
}

class RequestsCreator {
  RequestsCreator(this.db);

  final Databases db;

  final String playerIdAttName = 'playerId';
  final String statusAttName = 'status';
  final String matchedPlayerAttName = 'matchedPlayer';
  final String matchIdAttName = 'matchId';

  final String collectionId = requetsCollectionId;

  ///creates the match collection and if the creation is successful
  ///all its attributes
  Future<void> createRequestsCollection() async {
    final matchRequestsCollectionCreation =
        TaskEither<AppwriteException, void>.tryCatch(
      () => db.createCollection(
        collectionId: collectionId,
        name: collectionId,
        permission: 'document',
        read: ['role:member'],
        write: ['role:member'],
      ),
      (error, stackTrace) {
        logger.d(stackTrace);
        return error as AppwriteException;
      },
    );

    await (await matchRequestsCollectionCreation.run()).fold(
      (l) async {
        if (l.code == 409) {
          logger.d(' REQUESTS COLLECTION ALREADY EXISTS');
          await _createRequestsAtt();
        } else {
          logger.d(l);
        }
      },
      (r) async {
        logger.d('CREATED MATCH REQUESTS COLLECTION');
        await _createRequestsAtt();
      },
    );
  }

  Future<void> _createRequestsAtt() async {
    await _playerIdTask().run();
    await _statusTask().run();
    await _matchedPlayerTask().run();
    await _gameIdNameTask().run();
  }

  ///creates player id attribute

  TaskEither<AppwriteException, void> _playerIdTask() =>
      TaskEither<AppwriteException, void>.tryCatch(
        () async {
          //creates player id attribute
          await db.createStringAttribute(
            collectionId: collectionId,
            key: playerIdAttName,
            xrequired: true,
            array: false,
            size: 36,
          );
        },
        (error, stackTrace) {
          logger.d(stackTrace);
          return error as AppwriteException;
        },
      );

  ///creates request status attribute

  ///creates the match status attribute
  TaskEither<AppwriteException, void> _statusTask() =>
      TaskEither<AppwriteException, void>.tryCatch(
        () async {
          ///creates request status attribute
          await db.createEnumAttribute(
            collectionId: collectionId,
            key: statusAttName,
            xrequired: true,
            array: false,
            elements: RequestStatus.values.map((e) => e.name).toList(),
          );
        },
        (error, stackTrace) {
          logger.d(stackTrace);
          return error as AppwriteException;
        },
      );

  ///creates matched player id attribute
  TaskEither<AppwriteException, void> _matchedPlayerTask() =>
      TaskEither<AppwriteException, void>.tryCatch(
        () async {
          ///creates matched player id attribute
          await db.createStringAttribute(
            collectionId: collectionId,
            key: matchedPlayerAttName,
            xrequired: false,
            array: false,
            size: 36,
          );
        },
        (error, stackTrace) {
          logger.d(stackTrace);
          return error as AppwriteException;
        },
      );



  ///creates matched player id attribute
  TaskEither<AppwriteException, void> _gameIdNameTask() =>
      TaskEither<AppwriteException, void>.tryCatch(
        () async {
          ///creates match id for the two players
          await db.createStringAttribute(
            collectionId: collectionId,
            key: matchIdAttName,
            xrequired: false,
            array: false,
            size: 36,
          );
        },
        (error, stackTrace) {
          logger.d(stackTrace);
          return error as AppwriteException;
        },
      );
}
