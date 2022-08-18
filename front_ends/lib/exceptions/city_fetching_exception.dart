import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_fetching_exception.freezed.dart';

@freezed
class CityFetchingException with _$CityFetchingException {
  factory CityFetchingException.noCitiesFound() = _NoCityFound;
}