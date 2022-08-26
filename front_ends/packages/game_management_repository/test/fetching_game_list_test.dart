import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_management_repository/game_management_repository.dart';
import 'package:game_management_repository/src/constants/appwrite.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:collection/collection.dart';

import 'fetching_game_list_test.mocks.dart';

@GenerateMocks([Databases])
void main() {
  late MockDatabases _mockDatabases;

  _mockDatabases = MockDatabases();

  group('FetchingGameListTest -', () {
    final tempGameList = <GameData>{
      GameData(
        gameTitle: 'RPS',
        imageId: '123',
        description: 'Rock paper scissor game',
      ),
      GameData(
        gameTitle: 'quiz',
        imageId: '122',
        description: 'A messaging quiz game',
      ),
    };

    setUp(() {
      when(_mockDatabases.listDocuments(collectionId: gamesCollectionId))
          .thenAnswer(
        (realInvocation) => Future.value(
          DocumentList(
            documents: tempGameList
                .mapIndexed(
                  (index, element) => Document(
                    $id: '$index',
                    $collection: gamesCollectionId,
                    $createdAt: DateTime.now().millisecondsSinceEpoch + index,
                    $updatedAt: DateTime.now().millisecondsSinceEpoch + index,
                    $read: [],
                    $write: [],
                    data: element.toJson(),
                  ),
                )
                .toList(),
            total: tempGameList.length,
          ),
        ),
      );
    });

    final gameManagementRepository = GameManagementRepository()
      ..setup('endPoint', 'projectId', mockDatabase: _mockDatabases);
    test('fetch games list', () async {
      await gameManagementRepository.fetchGamesList().run();

      expect(
        setEquals(
          gameManagementRepository.gamesList,
          tempGameList,
        ),
        true,
      );
    });

    test('fetch games list - test re addition of existing games', () async {
      await gameManagementRepository.fetchGamesList().run();

      expect(
        setEquals(
          gameManagementRepository.gamesList,
          tempGameList,
        ),
        true,
      );
    });
  });
}
