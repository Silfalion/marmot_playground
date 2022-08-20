import 'dart:convert';

import 'package:appwrite_function/models/request/request.dart';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';
import 'package:fpdart/fpdart.dart';

/*
  'req' variable has:
    'headers' - object with request headers
    'payload' - object with request body data
    'env' - object with environment variables

  'res' variable has:
    'send(text, status)' - function to return text response. Status code defaults to 200
    'json(obj, status)' - function to return JSON response. Status code defaults to 200
  
  If an error is thrown, a response with code 500 will be returned.
*/

Future<void> start(final req, final res) async {
  Client client = Client();

  // You can remove services you don't use

  Databases database = Databases(client, databaseId: "marmot_playground_db");

  Users users = Users(client);

  if (req.env['APPWRITE_FUNCTION_ENDPOINT'] == null ||
      req.env['APPWRITE_FUNCTION_API_KEY'] == null) {
    print(
        "Environment variables are not set. Function cannot use Appwrite SDK.");

    return;
  } else {
    client
        .setEndpoint(req.env['APPWRITE_FUNCTION_ENDPOINT'])
        .setProject(req.env['APPWRITE_FUNCTION_PROJECT_ID'])
        .setKey(req.env['APPWRITE_FUNCTION_API_KEY'])
        .setSelfSigned(status: true);
  }

  final payload = req.payload?.isEmpty ? req.payload : null;

  if (payload != null) {
    await getCandidate(payload, database);

    //find a request

    //create a match

    //delete the request

    //exit

  }
  res.json({
    'areDevelopersAwesome': true,
  });
}

Future<String> getCandidate(payload, Databases database) async {
  Either<Object, Request> matchRequest = Either.tryCatch(
    () => Request.fromJson(jsonDecode(payload)),
    (o, s) => o,
  );

  final receivedRequest = matchRequest.getRight();

  if (receivedRequest.isSome()) {
    Either<AppwriteException, List<Document>> listRequests =
        (await getRequestDoc(database).run());

    final candidate = listRequests
        .map(
          (a) => a
              .filter((t) => t.$id != receivedRequest.map((t) => t.id))
              .toList(),
        )
        .getRight()
        .map(
      (t) {
        return t[0];
      },
    );
    return candidate
        .map((t) => t.data['playerId'])
        .getOrElse(() => 'No one found');
  }

  return 'No one found';
}

TaskEither<AppwriteException, List<Document>> getRequestDoc(
    Databases database) {
  return TaskEither.tryCatch(() async {
    return (await database.listDocuments(
            collectionId: "requests", orderAttributes: ['\$createdAt']))
        .documents;
  }, (error, stackTrace) => error as AppwriteException);
}
