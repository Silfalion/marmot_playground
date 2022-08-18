// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'city_fetching_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CityFetchingException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noCitiesFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noCitiesFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noCitiesFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoCityFound value) noCitiesFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoCityFound value)? noCitiesFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoCityFound value)? noCitiesFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityFetchingExceptionCopyWith<$Res> {
  factory $CityFetchingExceptionCopyWith(CityFetchingException value,
          $Res Function(CityFetchingException) then) =
      _$CityFetchingExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$CityFetchingExceptionCopyWithImpl<$Res>
    implements $CityFetchingExceptionCopyWith<$Res> {
  _$CityFetchingExceptionCopyWithImpl(this._value, this._then);

  final CityFetchingException _value;
  // ignore: unused_field
  final $Res Function(CityFetchingException) _then;
}

/// @nodoc
abstract class _$$_NoCityFoundCopyWith<$Res> {
  factory _$$_NoCityFoundCopyWith(
          _$_NoCityFound value, $Res Function(_$_NoCityFound) then) =
      __$$_NoCityFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NoCityFoundCopyWithImpl<$Res>
    extends _$CityFetchingExceptionCopyWithImpl<$Res>
    implements _$$_NoCityFoundCopyWith<$Res> {
  __$$_NoCityFoundCopyWithImpl(
      _$_NoCityFound _value, $Res Function(_$_NoCityFound) _then)
      : super(_value, (v) => _then(v as _$_NoCityFound));

  @override
  _$_NoCityFound get _value => super._value as _$_NoCityFound;
}

/// @nodoc

class _$_NoCityFound implements _NoCityFound {
  _$_NoCityFound();

  @override
  String toString() {
    return 'CityFetchingException.noCitiesFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NoCityFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noCitiesFound,
  }) {
    return noCitiesFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noCitiesFound,
  }) {
    return noCitiesFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noCitiesFound,
    required TResult orElse(),
  }) {
    if (noCitiesFound != null) {
      return noCitiesFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoCityFound value) noCitiesFound,
  }) {
    return noCitiesFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoCityFound value)? noCitiesFound,
  }) {
    return noCitiesFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoCityFound value)? noCitiesFound,
    required TResult orElse(),
  }) {
    if (noCitiesFound != null) {
      return noCitiesFound(this);
    }
    return orElse();
  }
}

abstract class _NoCityFound implements CityFetchingException {
  factory _NoCityFound() = _$_NoCityFound;
}
