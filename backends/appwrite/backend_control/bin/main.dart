import 'package:backend_control/collection_creators/games_creator.dart';
import 'package:backend_control/collection_creators/matches_creator.dart';
import 'package:backend_control/collection_creators/requests_creator.dart';
import 'package:backend_control/constants/consts.dart';
import 'package:backend_control/env/env.dart';
import 'package:backend_control/utils/logger.dart';
import 'package:dart_appwrite/dart_appwrite.dart';

void main() async {
  final client = Client();
  client.setEndpoint(Env.endpoint).setProject(Env.projectId).setKey(Env.apiKey);

  final db = Databases(
    client,
    databaseId: databaseName,
  );

  logger.i('Creating db');

  try {
    await db.create(name: databaseName);
    logger.d('DB created successfully');
  } catch (e) {
    logger.d(e);
  }

  logger.i('CREATING COLLECTIONS\n');

  final matchCreator = MatchesCreator(db);
  final matchRequestsCreator = RequestsCreator(db);
  final gamesRequestsCreator = GamesCreator(db);

  await matchCreator.createMatchesCollection();
  await matchRequestsCreator.createMatchRequestsCollection();
  await gamesRequestsCreator.createGamesCollection();
}
