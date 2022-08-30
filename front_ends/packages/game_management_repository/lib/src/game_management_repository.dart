import 'package:appwrite/appwrite.dart';
import 'package:fpdart/fpdart.dart';
import 'package:game_management_repository/src/constants/appwrite.dart';
import 'package:game_management_repository/src/models/models.dart'
    as local_models;

///repository responsible for fetching games
class GameManagementRepository {
  ///constructor
  GameManagementRepository({Client? client}) : _client = client ?? Client();

  ///initial setup
  void setup(
    String endPoint,
    String projectId, {
    String databaseId = 'marmot_playground_db',
    Databases? mockDatabase,
  }) {
    _projectId = projectId;

    _client.setEndpoint(endPoint).setProject(projectId);

    _database = mockDatabase ?? Databases(_client, databaseId: databaseId);

    _storage = Storage(_client);
  }

  final Client _client;

  ///identifier of the appwrite project on server
  late final String _projectId;

  ///Appwrite database service
  late final Databases _database;

  ///Appwrite storage service
  late final Storage _storage;

  //stores the list of games
  final Set<local_models.GameData> _gamesList = {};

  ///returns the list of games
  Set<local_models.GameData> get gamesList => _gamesList;

  ///name of the bucket storing the games images
  final String _bucketName = 'games_images';

  ///adds new games to the set if they're not there already
  void _addToGameList(List<local_models.GameData> newGames) {
    _gamesList.addAll(newGames);
  }

  ///fetches the list of games available on the server and their data
  TaskEither<Exception, Unit> fetchGamesList() {
    return TaskEither.tryCatch(
      () async {
        final documentList =
            await _database.listDocuments(collectionId: gamesCollectionId);

        return documentList;
      },
      (error, stackTrace) => error as Exception,
    ).map((r) {
      final tempGameList = r.documents
          .map((e) => local_models.GameData.fromJson(e.data))
          .toList();

      _addToGameList(tempGameList);

      return unit;
    });
  }

  ///returns the url to fetch a game image
  String imageUrl(String imageId) {
    
    return '${_client.endPoint}/storage/buckets/$_bucketName/files/$imageId/view?project=$_projectId';
  }
}
