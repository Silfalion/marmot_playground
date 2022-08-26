// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameData _$$_GameDataFromJson(Map<String, dynamic> json) => _$_GameData(
      imageId: json['imageId'] as String,
      gameTitle: json['gameTitle'] as String,
      description: json['description'] as String? ?? '',
      required: json['required'],
    );

Map<String, dynamic> _$$_GameDataToJson(_$_GameData instance) =>
    <String, dynamic>{
      'imageId': instance.imageId,
      'gameTitle': instance.gameTitle,
      'description': instance.description,
      'required': instance.required,
    };
