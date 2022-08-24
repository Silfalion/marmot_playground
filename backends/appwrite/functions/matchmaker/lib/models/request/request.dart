import 'package:freezed_annotation/freezed_annotation.dart';

part 'request.freezed.dart';
part 'request.g.dart';

@freezed
class Request with _$Request {
  factory Request({
    @JsonKey(name: '\$id') required String id,
    required String playerId,
    
    @JsonKey(name: '\$createdAt') required double createdAt,
    @JsonKey(name: '\$updatedAt') required double updatedAt,
  }) = _Request;

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);
}
