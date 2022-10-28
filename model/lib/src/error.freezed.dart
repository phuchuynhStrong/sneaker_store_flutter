// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommonError _$CommonErrorFromJson(Map<String, dynamic> json) {
  return _CommonError.fromJson(json);
}

/// @nodoc
mixin _$CommonError {
  String? get errorMsg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommonErrorCopyWith<CommonError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonErrorCopyWith<$Res> {
  factory $CommonErrorCopyWith(
          CommonError value, $Res Function(CommonError) then) =
      _$CommonErrorCopyWithImpl<$Res>;
  $Res call({String? errorMsg});
}

/// @nodoc
class _$CommonErrorCopyWithImpl<$Res> implements $CommonErrorCopyWith<$Res> {
  _$CommonErrorCopyWithImpl(this._value, this._then);

  final CommonError _value;
  // ignore: unused_field
  final $Res Function(CommonError) _then;

  @override
  $Res call({
    Object? errorMsg = freezed,
  }) {
    return _then(_value.copyWith(
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_CommonErrorCopyWith<$Res>
    implements $CommonErrorCopyWith<$Res> {
  factory _$$_CommonErrorCopyWith(
          _$_CommonError value, $Res Function(_$_CommonError) then) =
      __$$_CommonErrorCopyWithImpl<$Res>;
  @override
  $Res call({String? errorMsg});
}

/// @nodoc
class __$$_CommonErrorCopyWithImpl<$Res> extends _$CommonErrorCopyWithImpl<$Res>
    implements _$$_CommonErrorCopyWith<$Res> {
  __$$_CommonErrorCopyWithImpl(
      _$_CommonError _value, $Res Function(_$_CommonError) _then)
      : super(_value, (v) => _then(v as _$_CommonError));

  @override
  _$_CommonError get _value => super._value as _$_CommonError;

  @override
  $Res call({
    Object? errorMsg = freezed,
  }) {
    return _then(_$_CommonError(
      errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommonError implements _CommonError {
  _$_CommonError(this.errorMsg);

  factory _$_CommonError.fromJson(Map<String, dynamic> json) =>
      _$$_CommonErrorFromJson(json);

  @override
  final String? errorMsg;

  @override
  String toString() {
    return 'CommonError(errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommonError &&
            const DeepCollectionEquality().equals(other.errorMsg, errorMsg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(errorMsg));

  @JsonKey(ignore: true)
  @override
  _$$_CommonErrorCopyWith<_$_CommonError> get copyWith =>
      __$$_CommonErrorCopyWithImpl<_$_CommonError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommonErrorToJson(
      this,
    );
  }
}

abstract class _CommonError implements CommonError {
  factory _CommonError(final String? errorMsg) = _$_CommonError;

  factory _CommonError.fromJson(Map<String, dynamic> json) =
      _$_CommonError.fromJson;

  @override
  String? get errorMsg;
  @override
  @JsonKey(ignore: true)
  _$$_CommonErrorCopyWith<_$_CommonError> get copyWith =>
      throw _privateConstructorUsedError;
}
