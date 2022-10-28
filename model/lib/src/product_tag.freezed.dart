// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductTag _$ProductTagFromJson(Map<String, dynamic> json) {
  return _ProductTag.fromJson(json);
}

/// @nodoc
mixin _$ProductTag {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductTagCopyWith<ProductTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductTagCopyWith<$Res> {
  factory $ProductTagCopyWith(
          ProductTag value, $Res Function(ProductTag) then) =
      _$ProductTagCopyWithImpl<$Res>;
  $Res call({String name, String id});
}

/// @nodoc
class _$ProductTagCopyWithImpl<$Res> implements $ProductTagCopyWith<$Res> {
  _$ProductTagCopyWithImpl(this._value, this._then);

  final ProductTag _value;
  // ignore: unused_field
  final $Res Function(ProductTag) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductTagCopyWith<$Res>
    implements $ProductTagCopyWith<$Res> {
  factory _$$_ProductTagCopyWith(
          _$_ProductTag value, $Res Function(_$_ProductTag) then) =
      __$$_ProductTagCopyWithImpl<$Res>;
  @override
  $Res call({String name, String id});
}

/// @nodoc
class __$$_ProductTagCopyWithImpl<$Res> extends _$ProductTagCopyWithImpl<$Res>
    implements _$$_ProductTagCopyWith<$Res> {
  __$$_ProductTagCopyWithImpl(
      _$_ProductTag _value, $Res Function(_$_ProductTag) _then)
      : super(_value, (v) => _then(v as _$_ProductTag));

  @override
  _$_ProductTag get _value => super._value as _$_ProductTag;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_ProductTag(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductTag implements _ProductTag {
  _$_ProductTag({required this.name, required this.id});

  factory _$_ProductTag.fromJson(Map<String, dynamic> json) =>
      _$$_ProductTagFromJson(json);

  @override
  final String name;
  @override
  final String id;

  @override
  String toString() {
    return 'ProductTag(name: $name, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductTag &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_ProductTagCopyWith<_$_ProductTag> get copyWith =>
      __$$_ProductTagCopyWithImpl<_$_ProductTag>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductTagToJson(
      this,
    );
  }
}

abstract class _ProductTag implements ProductTag {
  factory _ProductTag({required final String name, required final String id}) =
      _$_ProductTag;

  factory _ProductTag.fromJson(Map<String, dynamic> json) =
      _$_ProductTag.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_ProductTagCopyWith<_$_ProductTag> get copyWith =>
      throw _privateConstructorUsedError;
}
