import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_management_repository/game_management_repository.dart';

part 'game_choice_state.dart';
part 'game_choice_cubit.freezed.dart';

class GameChoiceCubit extends Cubit<GameChoiceState> {
  GameChoiceCubit(this._gameManagementRepository)
      : super(const GameChoiceState.initial());

  final GameManagementRepository _gameManagementRepository;


  Future<void> fetchGames() async {
    emit(const GameChoiceState.loading());
    (await _gameManagementRepository.fetchGamesList().run()).fold(
      (l) => emit(GameChoiceState.failed(l)),
      (r) => emit(GameChoiceState.success(_gameManagementRepository.gamesList)),
    );
  }
}
