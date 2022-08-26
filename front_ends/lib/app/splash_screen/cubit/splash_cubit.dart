import 'package:appwrite_ruq_api/src/matchmaking_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_management_repository/game_management_repository.dart';
import 'package:marmot_playground/env/env.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(
    this._matchmakingRepository,
    this._gameManagementRepository,
  ) : super(const SplashState.initial());

  final MatchmakingRepository _matchmakingRepository;

  final GameManagementRepository _gameManagementRepository;

  Future<void> loadStuff() async {
    emit(const SplashState.sessionCreation());
    final result =
        await _matchmakingRepository.setup(Env.endpoint, Env.projectId).run();

    result.flatMap(
      (a) {
        emit(const SplashState.settingUpDBConnection());

        return Either.tryCatch(
          () => _gameManagementRepository.setup(Env.endpoint, Env.projectId),
          (o, s) => o as Exception,
        );
      },
    ).fold(
      (l) => emit(SplashState.failed(l)),
      (r) {
        emit(const SplashState.loaded());
      },
    );
  }
}
