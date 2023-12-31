// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() http,
    required TResult Function() unknown,
    required TResult Function() unexpected,
    required TResult Function() notFound,
    required TResult Function() insufficientPermissions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? http,
    TResult? Function()? unknown,
    TResult? Function()? unexpected,
    TResult? Function()? notFound,
    TResult? Function()? insufficientPermissions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? http,
    TResult Function()? unknown,
    TResult Function()? unexpected,
    TResult Function()? notFound,
    TResult Function()? insufficientPermissions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Http value) http,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_InsufficientPermissions value)
        insufficientPermissions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Http value)? http,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_InsufficientPermissions value)? insufficientPermissions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Http value)? http,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_InsufficientPermissions value)? insufficientPermissions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteFailureCopyWith<$Res> {
  factory $NoteFailureCopyWith(
          NoteFailure value, $Res Function(NoteFailure) then) =
      _$NoteFailureCopyWithImpl<$Res, NoteFailure>;
}

/// @nodoc
class _$NoteFailureCopyWithImpl<$Res, $Val extends NoteFailure>
    implements $NoteFailureCopyWith<$Res> {
  _$NoteFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_HttpCopyWith<$Res> {
  factory _$$_HttpCopyWith(_$_Http value, $Res Function(_$_Http) then) =
      __$$_HttpCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_HttpCopyWithImpl<$Res>
    extends _$NoteFailureCopyWithImpl<$Res, _$_Http>
    implements _$$_HttpCopyWith<$Res> {
  __$$_HttpCopyWithImpl(_$_Http _value, $Res Function(_$_Http) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Http implements _Http {
  const _$_Http();

  @override
  String toString() {
    return 'NoteFailure.http()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Http);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() http,
    required TResult Function() unknown,
    required TResult Function() unexpected,
    required TResult Function() notFound,
    required TResult Function() insufficientPermissions,
  }) {
    return http();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? http,
    TResult? Function()? unknown,
    TResult? Function()? unexpected,
    TResult? Function()? notFound,
    TResult? Function()? insufficientPermissions,
  }) {
    return http?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? http,
    TResult Function()? unknown,
    TResult Function()? unexpected,
    TResult Function()? notFound,
    TResult Function()? insufficientPermissions,
    required TResult orElse(),
  }) {
    if (http != null) {
      return http();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Http value) http,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_InsufficientPermissions value)
        insufficientPermissions,
  }) {
    return http(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Http value)? http,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_InsufficientPermissions value)? insufficientPermissions,
  }) {
    return http?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Http value)? http,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_InsufficientPermissions value)? insufficientPermissions,
    required TResult orElse(),
  }) {
    if (http != null) {
      return http(this);
    }
    return orElse();
  }
}

abstract class _Http implements NoteFailure {
  const factory _Http() = _$_Http;
}

/// @nodoc
abstract class _$$_UnknownCopyWith<$Res> {
  factory _$$_UnknownCopyWith(
          _$_Unknown value, $Res Function(_$_Unknown) then) =
      __$$_UnknownCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnknownCopyWithImpl<$Res>
    extends _$NoteFailureCopyWithImpl<$Res, _$_Unknown>
    implements _$$_UnknownCopyWith<$Res> {
  __$$_UnknownCopyWithImpl(_$_Unknown _value, $Res Function(_$_Unknown) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Unknown implements _Unknown {
  const _$_Unknown();

  @override
  String toString() {
    return 'NoteFailure.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Unknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() http,
    required TResult Function() unknown,
    required TResult Function() unexpected,
    required TResult Function() notFound,
    required TResult Function() insufficientPermissions,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? http,
    TResult? Function()? unknown,
    TResult? Function()? unexpected,
    TResult? Function()? notFound,
    TResult? Function()? insufficientPermissions,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? http,
    TResult Function()? unknown,
    TResult Function()? unexpected,
    TResult Function()? notFound,
    TResult Function()? insufficientPermissions,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Http value) http,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_InsufficientPermissions value)
        insufficientPermissions,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Http value)? http,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_InsufficientPermissions value)? insufficientPermissions,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Http value)? http,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_InsufficientPermissions value)? insufficientPermissions,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements NoteFailure {
  const factory _Unknown() = _$_Unknown;
}

/// @nodoc
abstract class _$$_UnexpectedCopyWith<$Res> {
  factory _$$_UnexpectedCopyWith(
          _$_Unexpected value, $Res Function(_$_Unexpected) then) =
      __$$_UnexpectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnexpectedCopyWithImpl<$Res>
    extends _$NoteFailureCopyWithImpl<$Res, _$_Unexpected>
    implements _$$_UnexpectedCopyWith<$Res> {
  __$$_UnexpectedCopyWithImpl(
      _$_Unexpected _value, $Res Function(_$_Unexpected) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Unexpected implements _Unexpected {
  const _$_Unexpected();

  @override
  String toString() {
    return 'NoteFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Unexpected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() http,
    required TResult Function() unknown,
    required TResult Function() unexpected,
    required TResult Function() notFound,
    required TResult Function() insufficientPermissions,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? http,
    TResult? Function()? unknown,
    TResult? Function()? unexpected,
    TResult? Function()? notFound,
    TResult? Function()? insufficientPermissions,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? http,
    TResult Function()? unknown,
    TResult Function()? unexpected,
    TResult Function()? notFound,
    TResult Function()? insufficientPermissions,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Http value) http,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_InsufficientPermissions value)
        insufficientPermissions,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Http value)? http,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_InsufficientPermissions value)? insufficientPermissions,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Http value)? http,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_InsufficientPermissions value)? insufficientPermissions,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements NoteFailure {
  const factory _Unexpected() = _$_Unexpected;
}

/// @nodoc
abstract class _$$_NotFoundCopyWith<$Res> {
  factory _$$_NotFoundCopyWith(
          _$_NotFound value, $Res Function(_$_NotFound) then) =
      __$$_NotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotFoundCopyWithImpl<$Res>
    extends _$NoteFailureCopyWithImpl<$Res, _$_NotFound>
    implements _$$_NotFoundCopyWith<$Res> {
  __$$_NotFoundCopyWithImpl(
      _$_NotFound _value, $Res Function(_$_NotFound) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NotFound implements _NotFound {
  const _$_NotFound();

  @override
  String toString() {
    return 'NoteFailure.notFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() http,
    required TResult Function() unknown,
    required TResult Function() unexpected,
    required TResult Function() notFound,
    required TResult Function() insufficientPermissions,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? http,
    TResult? Function()? unknown,
    TResult? Function()? unexpected,
    TResult? Function()? notFound,
    TResult? Function()? insufficientPermissions,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? http,
    TResult Function()? unknown,
    TResult Function()? unexpected,
    TResult Function()? notFound,
    TResult Function()? insufficientPermissions,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Http value) http,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_InsufficientPermissions value)
        insufficientPermissions,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Http value)? http,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_InsufficientPermissions value)? insufficientPermissions,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Http value)? http,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_InsufficientPermissions value)? insufficientPermissions,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound implements NoteFailure {
  const factory _NotFound() = _$_NotFound;
}

/// @nodoc
abstract class _$$_InsufficientPermissionsCopyWith<$Res> {
  factory _$$_InsufficientPermissionsCopyWith(_$_InsufficientPermissions value,
          $Res Function(_$_InsufficientPermissions) then) =
      __$$_InsufficientPermissionsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InsufficientPermissionsCopyWithImpl<$Res>
    extends _$NoteFailureCopyWithImpl<$Res, _$_InsufficientPermissions>
    implements _$$_InsufficientPermissionsCopyWith<$Res> {
  __$$_InsufficientPermissionsCopyWithImpl(_$_InsufficientPermissions _value,
      $Res Function(_$_InsufficientPermissions) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InsufficientPermissions implements _InsufficientPermissions {
  const _$_InsufficientPermissions();

  @override
  String toString() {
    return 'NoteFailure.insufficientPermissions()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InsufficientPermissions);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() http,
    required TResult Function() unknown,
    required TResult Function() unexpected,
    required TResult Function() notFound,
    required TResult Function() insufficientPermissions,
  }) {
    return insufficientPermissions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? http,
    TResult? Function()? unknown,
    TResult? Function()? unexpected,
    TResult? Function()? notFound,
    TResult? Function()? insufficientPermissions,
  }) {
    return insufficientPermissions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? http,
    TResult Function()? unknown,
    TResult Function()? unexpected,
    TResult Function()? notFound,
    TResult Function()? insufficientPermissions,
    required TResult orElse(),
  }) {
    if (insufficientPermissions != null) {
      return insufficientPermissions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Http value) http,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_InsufficientPermissions value)
        insufficientPermissions,
  }) {
    return insufficientPermissions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Http value)? http,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_InsufficientPermissions value)? insufficientPermissions,
  }) {
    return insufficientPermissions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Http value)? http,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_InsufficientPermissions value)? insufficientPermissions,
    required TResult orElse(),
  }) {
    if (insufficientPermissions != null) {
      return insufficientPermissions(this);
    }
    return orElse();
  }
}

abstract class _InsufficientPermissions implements NoteFailure {
  const factory _InsufficientPermissions() = _$_InsufficientPermissions;
}
