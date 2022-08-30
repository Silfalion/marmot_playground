// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marmot_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MarmotRequest _$$_MarmotRequestFromJson(Map<String, dynamic> json) =>
    _$_MarmotRequest(
      playerId: json['playerId'] as String,
      matchedPlayerId: json['matchedPlayerId'] as String?,
      status: $enumDecode(_$RequestStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_MarmotRequestToJson(_$_MarmotRequest instance) {
  final val = <String, dynamic>{
    'playerId': instance.playerId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('matchedPlayerId', instance.matchedPlayerId);
  val['status'] = _$RequestStatusEnumMap[instance.status]!;
  return val;
}

const _$RequestStatusEnumMap = {
  RequestStatus.standby: 'standby',
  RequestStatus.cancelled: 'cancelled',
  RequestStatus.matched: 'matched',
};
