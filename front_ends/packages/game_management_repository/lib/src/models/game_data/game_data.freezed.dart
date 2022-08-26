// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameData _$GameDataFromJson(Map<String, dynamic> json) {
  return _GameData.fromJson(json);
}

/// @nodoc
mixin _$GameData {
  String get imageId => throw _privateConstructorUsedError;
  String get gameTitle => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  dynamic get required => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameDataCopyWith<GameData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameDataCopyWith<$Res> {
  factory $GameDataCopyWith(GameData value, $Res Function(GameData) then) =
      _$GameDataCopyWithImpl<$Res>;
  $Res call(
      {String imageId, String gameTitle, String description, dynamic required});
}

/// @nodoc
class _$GameDataCopyWithImpl<$Res> implements $GameDataCopyWith<$Res> {
  _$GameDataCopyWithImpl(this._value, this._then);

  final GameData _value;
  // ignore: unused_field
  final $Res Function(GameData) _then;

  @override
  $Res call({
    Object? imageId = freezed,
    Object? gameTitle = freezed,
    Object? description = freezed,
    Object? required = freezed,
  }) {
    return _then(_value.copyWith(
      imageId: imageId == freezed
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
      gameTitle: gameTitle == freezed
          ? _value.gameTitle
          : gameTitle // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      required: required == freezed
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_GameDataCopyWith<$Res> implements $GameDataCopyWith<$Res> {
  factory _$$_GameDataCopyWith(
          _$_GameData value, $Res Function(_$_GameData) then) =
      __$$_GameDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String imageId, String gameTitle, String description, dynamic required});
}

/// @nodoc
class __$$_GameDataCopyWithImpl<$Res> extends _$GameDataCopyWithImpl<$Res>
    implements _$$_GameDataCopyWith<$Res> {
  __$$_GameDataCopyWithImpl(
      _$_GameData _value, $Res Function(_$_GameData) _then)
      : super(_value, (v) => _then(v as _$_GameData));

  @override
  _$_GameData get _value => super._value as _$_GameData;

  @override
  $Res call({
    Object? imageId = freezed,
    Object? gameTitle = freezed,
    Object? description = freezed,
    Object? required = freezed,
  }) {
    return _then(_$_GameData(
      imageId: imageId == freezed
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
      gameTitle: gameTitle == freezed
          ? _value.gameTitle
          : gameTitle // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      required: required == freezed ? _value.required : required,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameData implements _GameData {
  _$_GameData(
      {required this.imageId,
      required this.gameTitle,
      this.description = '',
      this.required});

  factory _$_GameData.fromJson(Map<String, dynamic> json) =>
      _$$_GameDataFromJson(json);

  @override
  final String imageId;
  @override
  final String gameTitle;
  @override
  @JsonKey()
  final String description;
  @override
  final dynamic required;

  @override
  String toString() {
    return 'GameData(imageId: $imageId, gameTitle: $gameTitle, description: $description, required: $required)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameData &&
            const DeepCollectionEquality().equals(other.imageId, imageId) &&
            const DeepCollectionEquality().equals(other.gameTitle, gameTitle) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.required, required));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imageId),
      const DeepCollectionEquality().hash(gameTitle),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(required));

  @JsonKey(ignore: true)
  @override
  _$$_GameDataCopyWith<_$_GameData> get copyWith =>
      __$$_GameDataCopyWithImpl<_$_GameData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameDataToJson(
      this,
    );
  }
}

abstract class _GameData implements GameData {
  factory _GameData(
      {required final String imageId,
      required final String gameTitle,
      final String description,
      final dynamic required}) = _$_GameData;

  factory _GameData.fromJson(Map<String, dynamic> json) = _$_GameData.fromJson;

  @override
  String get imageId;
  @override
  String get gameTitle;
  @override
  String get description;
  @override
  dynamic get required;
  @override
  @JsonKey(ignore: true)
  _$$_GameDataCopyWith<_$_GameData> get copyWith =>
      throw _privateConstructorUsedError;
}
