part of 'game_choice_cubit.dart';

@freezed
class GameChoiceState with _$GameChoiceState {
  const factory GameChoiceState.initial() = _Initial;
  const factory GameChoiceState.loading() = _Loading;
  const factory GameChoiceState.success(Set<GameData> games) = _Success;
  const factory GameChoiceState.failed(Exception e) = _Failed;
}
