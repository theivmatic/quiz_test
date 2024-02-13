// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preparations_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreparationsEntity _$PreparationsEntityFromJson(Map<String, dynamic> json) =>
    PreparationsEntity(
      preparations: (json['preparations'] as List<dynamic>?)
          ?.map((e) => Preparation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PreparationsEntityToJson(PreparationsEntity instance) =>
    <String, dynamic>{
      'preparations': instance.preparations,
    };

Preparation _$PreparationFromJson(Map<String, dynamic> json) => Preparation(
      preparationName: json['preparation_name'] as String?,
      imagePath: json['image_path'] as String?,
      title: json['title'] as String?,
      facts: (json['facts'] as List<dynamic>?)
          ?.map((e) => Fact.fromJson(e as Map<String, dynamic>))
          .toList(),
      subtitle: json['subtitle'] as String?,
      smallFacts: (json['small_facts'] as List<dynamic>?)
          ?.map((e) => SmallFact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PreparationToJson(Preparation instance) =>
    <String, dynamic>{
      'preparation_name': instance.preparationName,
      'image_path': instance.imagePath,
      'title': instance.title,
      'facts': instance.facts,
      'subtitle': instance.subtitle,
      'small_facts': instance.smallFacts,
    };

Fact _$FactFromJson(Map<String, dynamic> json) => Fact(
      number: json['number'] as String?,
      text: json['text'] as String?,
      imagePath: json['image_path'] as String?,
      subtext: json['subtext'] as String?,
    );

Map<String, dynamic> _$FactToJson(Fact instance) => <String, dynamic>{
      'number': instance.number,
      'text': instance.text,
      'image_path': instance.imagePath,
      'subtext': instance.subtext,
    };

SmallFact _$SmallFactFromJson(Map<String, dynamic> json) => SmallFact(
      text: json['text'] as String?,
    );

Map<String, dynamic> _$SmallFactToJson(SmallFact instance) => <String, dynamic>{
      'text': instance.text,
    };
