part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  ///initial
  const factory SplashState.initial() = _Initial;

  ///creating anonymous session
  const factory SplashState.sessionCreation() = _SessionCreation;

  ///DB connection setup
  const factory SplashState.settingUpDBConnection() = _SettingUpDBConnection;

  ///finished
  const factory SplashState.loaded() = _Loaded;

  ///failed
  const factory SplashState.failed(Exception e) = _Failed;
}
