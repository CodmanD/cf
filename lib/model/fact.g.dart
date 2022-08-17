// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fact _$FactFromJson(Map<String, dynamic> json) => Fact(
      id: json['_id'] as String,
      v: json['__v'] as int,
      text: json['text'] as String,
      createdDate: json['createdAt'] as String,
    );

Map<String, dynamic> _$FactToJson(Fact instance) => <String, dynamic>{
      '_id': instance.id,
      '__v': instance.v,
      'text': instance.text,
    };
