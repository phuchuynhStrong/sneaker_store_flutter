import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_tag.freezed.dart';
part 'product_tag.g.dart';

@freezed
class ProductTag with _$ProductTag {
  factory ProductTag({
    required String name,
    required String id,
  }) = _ProductTag;

  factory ProductTag.fromJson(Map<String, dynamic> json) =>
      _$ProductTagFromJson(json);
}
