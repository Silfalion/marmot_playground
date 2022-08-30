import 'dart:developer';

import 'package:backend_control/collection_creators/games_creator.dart';
import 'package:backend_control/collection_creators/matches_creator.dart';
import 'package:backend_control/collection_creators/requests_creator.dart';
import 'package:backend_control/constants/consts.dart';
import 'package:backend_control/env/env.dart';
import 'package:dart_appwrite/dart_appwrite.dart';

void main() async {
  final client = Client();
  client.setEndpoint(Env.endpoint).setProject(Env.projectId).setKey(Env.apiKey);

  final db = Databases(
    client,
    databaseId: databaseName,
  );

  print('Creating db');

  try {
    await db.create(name: databaseName);
    log('DB created successfully');
  } catch (e) {
    print(e);
  }

  print('CREATING COLLECTIONS\n');

  final matchCreator = MatchesCreator(db);
  final requestsCreator = RequestsCreator(db);
  final gamesCreator = GamesCreator(db);

  await matchCreator.createMatchesCollection();
  await requestsCreator.createRequestsCollection();
  // await gamesCreator.createGamesCollection();

  return;
}
