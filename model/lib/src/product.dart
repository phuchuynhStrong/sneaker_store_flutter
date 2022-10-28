import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/src/entity.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    required String name,
    required String id,
    required Entity category,
    required double size,
    required double price,
    String? thumbnail,
    String? image,
    String? description,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
