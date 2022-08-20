// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Request _$$_RequestFromJson(Map<String, dynamic> json) => _$_Request(
      id: json[r'$id'] as String,
      playerId: json['playerId'] as String,
      createdAt: (json[r'$createdAt'] as num).toDouble(),
      updatedAt: (json[r'$updatedAt'] as num).toDouble(),
    );

Map<String, dynamic> _$$_RequestToJson(_$_Request instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      'playerId': instance.playerId,
      r'$createdAt': instance.createdAt,
      r'$updatedAt': instance.updatedAt,
    };
