



import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_data.freezed.dart';
part 'game_data.g.dart';

@Freezed(equal: true)
class GameData with _$GameData {
  factory GameData({
    required String imageId,
    required String gameTitle,
   @Default('') String description,
    required
  }) = _GameData;

factory GameData.fromJson(Map<String, dynamic> json) => 
_$GameDataFromJson(json);
}
