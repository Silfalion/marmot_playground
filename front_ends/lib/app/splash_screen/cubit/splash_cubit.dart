import 'package:appwrite_ruq_api/src/matchmaking_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marmot_playground/env/env.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.matchmakingRepository) : super(const SplashState.initial());

  MatchmakingRepository matchmakingRepository;

  Future<void> loadStuff() async {
    await Future<void>.delayed(const Duration(seconds: 4));

    final result =
        await matchmakingRepository.setup(Env.endpoint, Env.projectId).run();

    result.fold(
      (l) => emit(SplashState.failed(l)),
      (r) => emit(const SplashState.loaded()),
    );
  }
}
