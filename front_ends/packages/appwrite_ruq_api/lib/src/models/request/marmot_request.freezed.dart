// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'marmot_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MarmotRequest _$MarmotRequestFromJson(Map<String, dynamic> json) {
  return _MarmotRequest.fromJson(json);
}

/// @nodoc
mixin _$MarmotRequest {
  String get playerId => throw _privateConstructorUsedError;
  String? get matchedPlayerId => throw _privateConstructorUsedError;
  RequestStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarmotRequestCopyWith<MarmotRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarmotRequestCopyWith<$Res> {
  factory $MarmotRequestCopyWith(
          MarmotRequest value, $Res Function(MarmotRequest) then) =
      _$MarmotRequestCopyWithImpl<$Res>;
  $Res call({String playerId, String? matchedPlayerId, RequestStatus status});
}

/// @nodoc
class _$MarmotRequestCopyWithImpl<$Res>
    implements $MarmotRequestCopyWith<$Res> {
  _$MarmotRequestCopyWithImpl(this._value, this._then);

  final MarmotRequest _value;
  // ignore: unused_field
  final $Res Function(MarmotRequest) _then;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? matchedPlayerId = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      matchedPlayerId: matchedPlayerId == freezed
          ? _value.matchedPlayerId
          : matchedPlayerId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_MarmotRequestCopyWith<$Res>
    implements $MarmotRequestCopyWith<$Res> {
  factory _$$_MarmotRequestCopyWith(
          _$_MarmotRequest value, $Res Function(_$_MarmotRequest) then) =
      __$$_MarmotRequestCopyWithImpl<$Res>;
  @override
  $Res call({String playerId, String? matchedPlayerId, RequestStatus status});
}

/// @nodoc
class __$$_MarmotRequestCopyWithImpl<$Res>
    extends _$MarmotRequestCopyWithImpl<$Res>
    implements _$$_MarmotRequestCopyWith<$Res> {
  __$$_MarmotRequestCopyWithImpl(
      _$_MarmotRequest _value, $Res Function(_$_MarmotRequest) _then)
      : super(_value, (v) => _then(v as _$_MarmotRequest));

  @override
  _$_MarmotRequest get _value => super._value as _$_MarmotRequest;

  @override
  $Res call({
    Object? playerId = freezed,
    Object? matchedPlayerId = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_MarmotRequest(
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      matchedPlayerId: matchedPlayerId == freezed
          ? _value.matchedPlayerId
          : matchedPlayerId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_MarmotRequest implements _MarmotRequest {
  _$_MarmotRequest(
      {required this.playerId, this.matchedPlayerId, required this.status});

  factory _$_MarmotRequest.fromJson(Map<String, dynamic> json) =>
      _$$_MarmotRequestFromJson(json);

  @override
  final String playerId;
  @override
  final String? matchedPlayerId;
  @override
  final RequestStatus status;

  @override
  String toString() {
    return 'MarmotRequest(playerId: $playerId, matchedPlayerId: $matchedPlayerId, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarmotRequest &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality()
                .equals(other.matchedPlayerId, matchedPlayerId) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(matchedPlayerId),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_MarmotRequestCopyWith<_$_MarmotRequest> get copyWith =>
      __$$_MarmotRequestCopyWithImpl<_$_MarmotRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MarmotRequestToJson(
      this,
    );
  }
}

abstract class _MarmotRequest implements MarmotRequest {
  factory _MarmotRequest(
      {required final String playerId,
      final String? matchedPlayerId,
      required final RequestStatus status}) = _$_MarmotRequest;

  factory _MarmotRequest.fromJson(Map<String, dynamic> json) =
      _$_MarmotRequest.fromJson;

  @override
  String get playerId;
  @override
  String? get matchedPlayerId;
  @override
  RequestStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_MarmotRequestCopyWith<_$_MarmotRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
