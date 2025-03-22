// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppException {
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(String? message) serverError,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) invalidData,
    required TResult Function(String? message) timeOut,
    required TResult Function(String? message) noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(String? message)? serverError,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? invalidData,
    TResult? Function(String? message)? timeOut,
    TResult? Function(String? message)? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(String? message)? serverError,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? invalidData,
    TResult Function(String? message)? timeOut,
    TResult Function(String? message)? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(InvalidData value) invalidData,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(NoInternet value) noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InvalidData value)? invalidData,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(NoInternet value)? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(InvalidData value)? invalidData,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppExceptionCopyWith<AppException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res, AppException>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res, $Val extends AppException>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$NetworkErrorImplCopyWith(
          _$NetworkErrorImpl value, $Res Function(_$NetworkErrorImpl) then) =
      __$$NetworkErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$NetworkErrorImpl>
    implements _$$NetworkErrorImplCopyWith<$Res> {
  __$$NetworkErrorImplCopyWithImpl(
      _$NetworkErrorImpl _value, $Res Function(_$NetworkErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NetworkErrorImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NetworkErrorImpl implements NetworkError {
  const _$NetworkErrorImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.networkError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      __$$NetworkErrorImplCopyWithImpl<_$NetworkErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(String? message) serverError,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) invalidData,
    required TResult Function(String? message) timeOut,
    required TResult Function(String? message) noInternet,
  }) {
    return networkError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(String? message)? serverError,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? invalidData,
    TResult? Function(String? message)? timeOut,
    TResult? Function(String? message)? noInternet,
  }) {
    return networkError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(String? message)? serverError,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? invalidData,
    TResult Function(String? message)? timeOut,
    TResult Function(String? message)? noInternet,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(InvalidData value) invalidData,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InvalidData value)? invalidData,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(InvalidData value)? invalidData,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkError implements AppException {
  const factory NetworkError([final String? message]) = _$NetworkErrorImpl;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
          _$ServerErrorImpl value, $Res Function(_$ServerErrorImpl) then) =
      __$$ServerErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl _value, $Res Function(_$ServerErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ServerErrorImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ServerErrorImpl implements ServerError {
  const _$ServerErrorImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.serverError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<_$ServerErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(String? message) serverError,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) invalidData,
    required TResult Function(String? message) timeOut,
    required TResult Function(String? message) noInternet,
  }) {
    return serverError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(String? message)? serverError,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? invalidData,
    TResult? Function(String? message)? timeOut,
    TResult? Function(String? message)? noInternet,
  }) {
    return serverError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(String? message)? serverError,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? invalidData,
    TResult Function(String? message)? timeOut,
    TResult Function(String? message)? noInternet,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(InvalidData value) invalidData,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InvalidData value)? invalidData,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(InvalidData value)? invalidData,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements AppException {
  const factory ServerError([final String? message]) = _$ServerErrorImpl;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$UnauthorizedImplCopyWith(
          _$UnauthorizedImpl value, $Res Function(_$UnauthorizedImpl) then) =
      __$$UnauthorizedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnauthorizedImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UnauthorizedImpl>
    implements _$$UnauthorizedImplCopyWith<$Res> {
  __$$UnauthorizedImplCopyWithImpl(
      _$UnauthorizedImpl _value, $Res Function(_$UnauthorizedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UnauthorizedImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnauthorizedImpl implements Unauthorized {
  const _$UnauthorizedImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.unauthorized(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      __$$UnauthorizedImplCopyWithImpl<_$UnauthorizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(String? message) serverError,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) invalidData,
    required TResult Function(String? message) timeOut,
    required TResult Function(String? message) noInternet,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(String? message)? serverError,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? invalidData,
    TResult? Function(String? message)? timeOut,
    TResult? Function(String? message)? noInternet,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(String? message)? serverError,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? invalidData,
    TResult Function(String? message)? timeOut,
    TResult Function(String? message)? noInternet,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(InvalidData value) invalidData,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InvalidData value)? invalidData,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(InvalidData value)? invalidData,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class Unauthorized implements AppException {
  const factory Unauthorized([final String? message]) = _$UnauthorizedImpl;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl value, $Res Function(_$NotFoundImpl) then) =
      __$$NotFoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NotFoundImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NotFoundImpl implements NotFound {
  const _$NotFoundImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.notFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      __$$NotFoundImplCopyWithImpl<_$NotFoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(String? message) serverError,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) invalidData,
    required TResult Function(String? message) timeOut,
    required TResult Function(String? message) noInternet,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(String? message)? serverError,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? invalidData,
    TResult? Function(String? message)? timeOut,
    TResult? Function(String? message)? noInternet,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(String? message)? serverError,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? invalidData,
    TResult Function(String? message)? timeOut,
    TResult Function(String? message)? noInternet,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(InvalidData value) invalidData,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InvalidData value)? invalidData,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(InvalidData value)? invalidData,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFound implements AppException {
  const factory NotFound([final String? message]) = _$NotFoundImpl;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidDataImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$InvalidDataImplCopyWith(
          _$InvalidDataImpl value, $Res Function(_$InvalidDataImpl) then) =
      __$$InvalidDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$InvalidDataImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$InvalidDataImpl>
    implements _$$InvalidDataImplCopyWith<$Res> {
  __$$InvalidDataImplCopyWithImpl(
      _$InvalidDataImpl _value, $Res Function(_$InvalidDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$InvalidDataImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InvalidDataImpl implements InvalidData {
  const _$InvalidDataImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.invalidData(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidDataImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidDataImplCopyWith<_$InvalidDataImpl> get copyWith =>
      __$$InvalidDataImplCopyWithImpl<_$InvalidDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(String? message) serverError,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) invalidData,
    required TResult Function(String? message) timeOut,
    required TResult Function(String? message) noInternet,
  }) {
    return invalidData(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(String? message)? serverError,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? invalidData,
    TResult? Function(String? message)? timeOut,
    TResult? Function(String? message)? noInternet,
  }) {
    return invalidData?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(String? message)? serverError,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? invalidData,
    TResult Function(String? message)? timeOut,
    TResult Function(String? message)? noInternet,
    required TResult orElse(),
  }) {
    if (invalidData != null) {
      return invalidData(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(InvalidData value) invalidData,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return invalidData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InvalidData value)? invalidData,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return invalidData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(InvalidData value)? invalidData,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (invalidData != null) {
      return invalidData(this);
    }
    return orElse();
  }
}

abstract class InvalidData implements AppException {
  const factory InvalidData([final String? message]) = _$InvalidDataImpl;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$InvalidDataImplCopyWith<_$InvalidDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeOutImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$TimeOutImplCopyWith(
          _$TimeOutImpl value, $Res Function(_$TimeOutImpl) then) =
      __$$TimeOutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$TimeOutImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$TimeOutImpl>
    implements _$$TimeOutImplCopyWith<$Res> {
  __$$TimeOutImplCopyWithImpl(
      _$TimeOutImpl _value, $Res Function(_$TimeOutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$TimeOutImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TimeOutImpl implements TimeOut {
  const _$TimeOutImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.timeOut(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeOutImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeOutImplCopyWith<_$TimeOutImpl> get copyWith =>
      __$$TimeOutImplCopyWithImpl<_$TimeOutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(String? message) serverError,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) invalidData,
    required TResult Function(String? message) timeOut,
    required TResult Function(String? message) noInternet,
  }) {
    return timeOut(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(String? message)? serverError,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? invalidData,
    TResult? Function(String? message)? timeOut,
    TResult? Function(String? message)? noInternet,
  }) {
    return timeOut?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(String? message)? serverError,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? invalidData,
    TResult Function(String? message)? timeOut,
    TResult Function(String? message)? noInternet,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(InvalidData value) invalidData,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return timeOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InvalidData value)? invalidData,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return timeOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(InvalidData value)? invalidData,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut(this);
    }
    return orElse();
  }
}

abstract class TimeOut implements AppException {
  const factory TimeOut([final String? message]) = _$TimeOutImpl;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$TimeOutImplCopyWith<_$TimeOutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoInternetImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$NoInternetImplCopyWith(
          _$NoInternetImpl value, $Res Function(_$NoInternetImpl) then) =
      __$$NoInternetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$NoInternetImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$NoInternetImpl>
    implements _$$NoInternetImplCopyWith<$Res> {
  __$$NoInternetImplCopyWithImpl(
      _$NoInternetImpl _value, $Res Function(_$NoInternetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NoInternetImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NoInternetImpl implements NoInternet {
  const _$NoInternetImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.noInternet(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoInternetImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoInternetImplCopyWith<_$NoInternetImpl> get copyWith =>
      __$$NoInternetImplCopyWithImpl<_$NoInternetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(String? message) serverError,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) invalidData,
    required TResult Function(String? message) timeOut,
    required TResult Function(String? message) noInternet,
  }) {
    return noInternet(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(String? message)? serverError,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? invalidData,
    TResult? Function(String? message)? timeOut,
    TResult? Function(String? message)? noInternet,
  }) {
    return noInternet?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(String? message)? serverError,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? invalidData,
    TResult Function(String? message)? timeOut,
    TResult Function(String? message)? noInternet,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ServerError value) serverError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(InvalidData value) invalidData,
    required TResult Function(TimeOut value) timeOut,
    required TResult Function(NoInternet value) noInternet,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InvalidData value)? invalidData,
    TResult? Function(TimeOut value)? timeOut,
    TResult? Function(NoInternet value)? noInternet,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkError value)? networkError,
    TResult Function(ServerError value)? serverError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(InvalidData value)? invalidData,
    TResult Function(TimeOut value)? timeOut,
    TResult Function(NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class NoInternet implements AppException {
  const factory NoInternet([final String? message]) = _$NoInternetImpl;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$NoInternetImplCopyWith<_$NoInternetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
