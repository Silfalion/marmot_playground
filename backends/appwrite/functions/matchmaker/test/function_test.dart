import 'dart:convert';

import 'package:appwrite_function/main.dart';
import 'package:appwrite_function/models/request/request.dart';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'function_test.mocks.dart';

@GenerateMocks([Databases])
void main() {
  late MockDatabases _mockDatabases;

  setUp(() {
    _mockDatabases = MockDatabases();
  });

  group(
    'MainTest -',
    () {
      Map<String, dynamic> requestToJson(Request request) {
        return request.toJson()
          ..remove('\$id')
          ..remove('\$createdAt')
          ..remove('\$updatedAt');
      }

      test(
        'found matching',
        () async {
          when(
            _mockDatabases.listDocuments(
              collectionId: 'requests',
              orderAttributes: ['\$createdAt'],
            ),
          ).thenAnswer(
            (_) async {
              final docs = [
                Document(
                  $id: "1235",
                  $collection: '2',
                  $createdAt: DateTime.now().millisecondsSinceEpoch + 1,
                  $updatedAt: DateTime.now().millisecondsSinceEpoch + 1,
                  $read: ["role:all"],
                  $write: ["role:all"],
                  data: requestToJson(Request(
                      id: "1235",
                      playerId: "2",
                      createdAt: DateTime.now().millisecondsSinceEpoch + 1,
                      updatedAt: DateTime.now().millisecondsSinceEpoch + 1)),
                ),
                Document(
                  $id: "1234",
                  $collection: '2',
                  $createdAt: DateTime.now().millisecondsSinceEpoch,
                  $updatedAt: DateTime.now().millisecondsSinceEpoch,
                  $read: ["role:all"],
                  $write: ["role:all"],
                  data: requestToJson(
                    Request(
                      id: "1235",
                      playerId: "2",
                      createdAt: DateTime.now().millisecondsSinceEpoch + 0,
                      updatedAt: DateTime.now().millisecondsSinceEpoch + 0,
                    ),
                  ),
                ),
              ];

              return Future.value(
                DocumentList(documents: docs, total: docs.length),
              );
            },
          );

          final payload = jsonEncode(
            Request(
              id: '1234',
              playerId: '1',
              createdAt: DateTime.now().millisecondsSinceEpoch + 0,
              updatedAt: DateTime.now().millisecondsSinceEpoch + 0,
            ).toJson(),
          );

          expect((await getCandidate(payload, _mockDatabases)), '2');
        },
      );

      test(
        'Collection not found error',
        () async {
          when(
            _mockDatabases.listDocuments(
              collectionId: 'requests',
              orderAttributes: ['\$createdAt'],
            ),
          ).thenThrow(AppwriteException("Collection not found", 410));

          final payload = jsonEncode(
            Request(
              id: '1234',
              playerId: '1',
              createdAt: DateTime.now().millisecondsSinceEpoch + 0,
              updatedAt: DateTime.now().millisecondsSinceEpoch + 0,
            ).toJson(),
          );

          expect((await getCandidate(payload, _mockDatabases)), 'No one found');
        },
      );
    },
  );
}
