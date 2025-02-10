// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Choice _$ChoiceFromJson(Map<String, dynamic> json) => Choice(
      id: json['id'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      des: json['des'] as String?,
      isBasePrice: json['isBasePrice'] as bool?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => Lists.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChoiceToJson(Choice instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'des': instance.des,
      'isBasePrice': instance.isBasePrice,
      'list': instance.list,
    };
