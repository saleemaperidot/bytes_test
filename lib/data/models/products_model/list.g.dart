// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lists _$ListsFromJson(Map<String, dynamic> json) => Lists(
      id: json['id'] as String?,
      title: json['title'] as String?,
      des: json['des'] as String?,
      isActive: json['isActive'] as bool?,
      price: (json['price'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      isSelected: json['isSelected'] as bool?,
    );

Map<String, dynamic> _$ListsToJson(Lists instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'des': instance.des,
      'isActive': instance.isActive,
      'price': instance.price,
      'discount': instance.discount,
      'isSelected': instance.isSelected,
    };
