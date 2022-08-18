part of 'loading_cubit.dart';

@freezed
class LoadingCubitState with _$LoadingCubitState {
  const factory LoadingCubitState.initial() = _Initial;
  const factory LoadingCubitState.loading() = _Loading;
  const factory LoadingCubitState.loaded() = _Loaded;
  const factory LoadingCubitState.failed(
      CityFetchingException cityFetchingException) = _Failed;
}
