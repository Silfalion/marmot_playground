part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {

  ///initial
  const factory SplashState.initial() = _Initial;

  ///finished
  const factory SplashState.loaded() = _Loaded;


  ///failed
  const factory SplashState.failed(Exception e) = _Failed;
  
}
