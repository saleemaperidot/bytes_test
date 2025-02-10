// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String?,
      price: (json['price'] as num?)?.toInt(),
      discountPrice: (json['discountPrice'] as num?)?.toInt(),
      title: json['title'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      maxQuantity: (json['maxQuantity'] as num?)?.toInt(),
      image: (json['image'] as List<dynamic>?)
          ?.map((e) => ImageModels.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool?,
      statusText: json['statusText'] as String?,
      discounts: json['discounts'] as List<dynamic>?,
      type: json['type'] as String?,
      isCustomisable: json['isCustomisable'] as bool?,
      choice: (json['choice'] as List<dynamic>?)
          ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'title': instance.title,
      'quantity': instance.quantity,
      'maxQuantity': instance.maxQuantity,
      'image': instance.image,
      'status': instance.status,
      'statusText': instance.statusText,
      'discounts': instance.discounts,
      'type': instance.type,
      'isCustomisable': instance.isCustomisable,
      'choice': instance.choice,
    };
