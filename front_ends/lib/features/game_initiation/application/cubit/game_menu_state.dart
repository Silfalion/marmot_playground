part of 'game_menu_cubit.dart';

@freezed
class GameMenuState with _$GameMenuState {
  const factory GameMenuState.idle() = _Idle;
  const factory GameMenuState.loading() = _Loading;
  const factory GameMenuState.fail() = _Fail;
  const factory GameMenuState.success() = _Success;
}
