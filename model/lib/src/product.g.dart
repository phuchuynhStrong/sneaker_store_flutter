// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      name: json['name'] as String,
      id: json['id'] as String,
      category: Entity.fromJson(json['category'] as Map<String, dynamic>),
      size: (json['size'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      thumbnail: json['thumbnail'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'category': instance.category,
      'size': instance.size,
      'price': instance.price,
      'thumbnail': instance.thumbnail,
      'image': instance.image,
      'description': instance.description,
    };
