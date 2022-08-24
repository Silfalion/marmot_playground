import 'dart:async';

import 'package:appwrite_ruq_api/appwrite_ruq_api.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_menu_cubit.freezed.dart';
part 'game_menu_state.dart';

class GameMenuCubit extends Cubit<GameMenuState> {
  GameMenuCubit(this._matchmakingRepository)
      : super(const GameMenuState.idle());

  final MatchmakingRepository _matchmakingRepository;

  late StreamSubscription<User?> _matchmakingSubscription;

  Future<void> makeMatchmakingRequest() async {
    emit(const GameMenuState.loading());
    await _matchmakingRepository.findMatch();

    _matchmakingSubscription =
        _matchmakingRepository.opponentStream.stream.listen(
      (event) async {
        if (event == null) {
          emit(const GameMenuState.fail());
        } else {
          emit(const GameMenuState.success());
        }
        await _matchmakingSubscription.cancel();
      },
    );
  }
}
