import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_management_repository/game_management_repository.dart';

GameManagementRepository getGameManagementRepository(BuildContext context) {
  return RepositoryProvider.of<GameManagementRepository>(context);
}
