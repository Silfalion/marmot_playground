import 'package:appwrite_ruq_api/src/utils/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'marmot_request.freezed.dart';
part 'marmot_request.g.dart';

///request status
enum RequestStatus {
  ///waiting for match
  standby,

  ///matched cancelled
  cancelled,

  ///an opponent has been found
  matched,
}

@freezed
class MarmotRequest with _$MarmotRequest {
  @JsonSerializable(includeIfNull: false)
  factory MarmotRequest({
    required String playerId,
    String? matchedPlayerId,
    required RequestStatus status,
  }) = _MarmotRequest;

  factory MarmotRequest.fromJson(Map<String, dynamic> json) =>
      _$MarmotRequestFromJson(json);

}
