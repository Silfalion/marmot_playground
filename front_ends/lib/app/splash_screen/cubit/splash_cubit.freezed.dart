// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'splash_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SplashState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sessionCreation,
    required TResult Function() settingUpDBConnection,
    required TResult Function() loaded,
    required TResult Function(Exception e) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sessionCreation,
    TResult Function()? settingUpDBConnection,
    TResult Function()? loaded,
    TResult Function(Exception e)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sessionCreation,
    TResult Function()? settingUpDBConnection,
    TResult Function()? loaded,
    TResult Function(Exception e)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SessionCreation value) sessionCreation,
    required TResult Function(_SettingUpDBConnection value)
        settingUpDBConnection,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SessionCreation value)? sessionCreation,
    TResult Function(_SettingUpDBConnection value)? settingUpDBConnection,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SessionCreation value)? sessionCreation,
    TResult Function(_SettingUpDBConnection value)? settingUpDBConnection,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
          SplashState value, $Res Function(SplashState) then) =
      _$SplashStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res> implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  final SplashState _value;
  // ignore: unused_field
  final $Res Function(SplashState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$SplashStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SplashState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sessionCreation,
    required TResult Function() settingUpDBConnection,
    required TResult Function() loaded,
    required TResult Function(Exception e) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sessionCreation,
    TResult Function()? settingUpDBConnection,
    TResult Function()? loaded,
    TResult Function(Exception e)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sessionCreation,
    TResult Function()? settingUpDBConnection,
    TResult Function()? loaded,
    TResult Function(Exception e)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SessionCreation value) sessionCreation,
    required TResult Function(_SettingUpDBConnection value)
        settingUpDBConnection,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SessionCreation value)? sessionCreation,
    TResult Function(_SettingUpDBConnection value)? settingUpDBConnection,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SessionCreation value)? sessionCreation,
    TResult Function(_SettingUpDBConnection value)? settingUpDBConnection,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SplashState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_SessionCreationCopyWith<$Res> {
  factory _$$_SessionCreationCopyWith(
          _$_SessionCreation value, $Res Function(_$_SessionCreation) then) =
      __$$_SessionCreationCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SessionCreationCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res>
    implements _$$_SessionCreationCopyWith<$Res> {
  __$$_SessionCreationCopyWithImpl(
      _$_SessionCreation _value, $Res Function(_$_SessionCreation) _then)
      : super(_value, (v) => _then(v as _$_SessionCreation));

  @override
  _$_SessionCreation get _value => super._value as _$_SessionCreation;
}

/// @nodoc

class _$_SessionCreation implements _SessionCreation {
  const _$_SessionCreation();

  @override
  String toString() {
    return 'SplashState.sessionCreation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SessionCreation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sessionCreation,
    required TResult Function() settingUpDBConnection,
    required TResult Function() loaded,
    required TResult Function(Exception e) failed,
  }) {
    return sessionCreation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sessionCreation,
    TResult Function()? settingUpDBConnection,
    TResult Function()? loaded,
    TResult Function(Exception e)? failed,
  }) {
    return sessionCreation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sessionCreation,
    TResult Function()? settingUpDBConnection,
    TResult Function()? loaded,
    TResult Function(Exception e)? failed,
    required TResult orElse(),
  }) {
    if (sessionCreation != null) {
      return sessionCreation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SessionCreation value) sessionCreation,
    required TResult Function(_SettingUpDBConnection value)
        settingUpDBConnection,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) {
    return sessionCreation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SessionCreation value)? sessionCreation,
    TResult Function(_SettingUpDBConnection value)? settingUpDBConnection,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
  }) {
    return sessionCreation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SessionCreation value)? sessionCreation,
    TResult Function(_SettingUpDBConnection value)? settingUpDBConnection,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (sessionCreation != null) {
      return sessionCreation(this);
    }
    return orElse();
  }
}

abstract class _SessionCreation implements SplashState {
  const factory _SessionCreation() = _$_SessionCreation;
}

/// @nodoc
abstract class _$$_SettingUpDBConnectionCopyWith<$Res> {
  factory _$$_SettingUpDBConnectionCopyWith(_$_SettingUpDBConnection value,
          $Res Function(_$_SettingUpDBConnection) then) =
      __$$_SettingUpDBConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SettingUpDBConnectionCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res>
    implements _$$_SettingUpDBConnectionCopyWith<$Res> {
  __$$_SettingUpDBConnectionCopyWithImpl(_$_SettingUpDBConnection _value,
      $Res Function(_$_SettingUpDBConnection) _then)
      : super(_value, (v) => _then(v as _$_SettingUpDBConnection));

  @override
  _$_SettingUpDBConnection get _value =>
      super._value as _$_SettingUpDBConnection;
}

/// @nodoc

class _$_SettingUpDBConnection implements _SettingUpDBConnection {
  const _$_SettingUpDBConnection();

  @override
  String toString() {
    return 'SplashState.settingUpDBConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SettingUpDBConnection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sessionCreation,
    required TResult Function() settingUpDBConnection,
    required TResult Function() loaded,
    required TResult Function(Exception e) failed,
  }) {
    return settingUpDBConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sessionCreation,
    TResult Function()? settingUpDBConnection,
    TResult Function()? loaded,
    TResult Function(Exception e)? failed,
  }) {
    return settingUpDBConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sessionCreation,
    TResult Function()? settingUpDBConnection,
    TResult Function()? loaded,
    TResult Function(Exception e)? failed,
    required TResult orElse(),
  }) {
    if (settingUpDBConnection != null) {
      return settingUpDBConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SessionCreation value) sessionCreation,
    required TResult Function(_SettingUpDBConnection value)
        settingUpDBConnection,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) {
    return settingUpDBConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SessionCreation value)? sessionCreation,
    TResult Function(_SettingUpDBConnection value)? settingUpDBConnection,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
  }) {
    return settingUpDBConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SessionCreation value)? sessionCreation,
    TResult Function(_SettingUpDBConnection value)? settingUpDBConnection,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (settingUpDBConnection != null) {
      return settingUpDBConnection(this);
    }
    return orElse();
  }
}

abstract class _SettingUpDBConnection implements SplashState {
  const factory _SettingUpDBConnection() = _$_SettingUpDBConnection;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res> extends _$SplashStateCopyWithImpl<$Res>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, (v) => _then(v as _$_Loaded));

  @override
  _$_Loaded get _value => super._value as _$_Loaded;
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded();

  @override
  String toString() {
    return 'SplashState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sessionCreation,
    required TResult Function() settingUpDBConnection,
    required TResult Function() loaded,
    required TResult Function(Exception e) failed,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sessionCreation,
    TResult Function()? settingUpDBConnection,
    TResult Function()? loaded,
    TResult Function(Exception e)? failed,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sessionCreation,
    TResult Function()? settingUpDBConnection,
    TResult Function()? loaded,
    TResult Function(Exception e)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SessionCreation value) sessionCreation,
    required TResult Function(_SettingUpDBConnection value)
        settingUpDBConnection,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SessionCreation value)? sessionCreation,
    TResult Function(_SettingUpDBConnection value)? settingUpDBConnection,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SessionCreation value)? sessionCreation,
    TResult Function(_SettingUpDBConnection value)? settingUpDBConnection,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements SplashState {
  const factory _Loaded() = _$_Loaded;
}

/// @nodoc
abstract class _$$_FailedCopyWith<$Res> {
  factory _$$_FailedCopyWith(_$_Failed value, $Res Function(_$_Failed) then) =
      __$$_FailedCopyWithImpl<$Res>;
  $Res call({Exception e});
}

/// @nodoc
class __$$_FailedCopyWithImpl<$Res> extends _$SplashStateCopyWithImpl<$Res>
    implements _$$_FailedCopyWith<$Res> {
  __$$_FailedCopyWithImpl(_$_Failed _value, $Res Function(_$_Failed) _then)
      : super(_value, (v) => _then(v as _$_Failed));

  @override
  _$_Failed get _value => super._value as _$_Failed;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_$_Failed(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_Failed implements _Failed {
  const _$_Failed(this.e);

  @override
  final Exception e;

  @override
  String toString() {
    return 'SplashState.failed(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failed &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  _$$_FailedCopyWith<_$_Failed> get copyWith =>
      __$$_FailedCopyWithImpl<_$_Failed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sessionCreation,
    required TResult Function() settingUpDBConnection,
    required TResult Function() loaded,
    required TResult Function(Exception e) failed,
  }) {
    return failed(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sessionCreation,
    TResult Function()? settingUpDBConnection,
    TResult Function()? loaded,
    TResult Function(Exception e)? failed,
  }) {
    return failed?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sessionCreation,
    TResult Function()? settingUpDBConnection,
    TResult Function()? loaded,
    TResult Function(Exception e)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SessionCreation value) sessionCreation,
    required TResult Function(_SettingUpDBConnection value)
        settingUpDBConnection,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SessionCreation value)? sessionCreation,
    TResult Function(_SettingUpDBConnection value)? settingUpDBConnection,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SessionCreation value)? sessionCreation,
    TResult Function(_SettingUpDBConnection value)? settingUpDBConnection,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements SplashState {
  const factory _Failed(final Exception e) = _$_Failed;

  Exception get e;
  @JsonKey(ignore: true)
  _$$_FailedCopyWith<_$_Failed> get copyWith =>
      throw _privateConstructorUsedError;
}
