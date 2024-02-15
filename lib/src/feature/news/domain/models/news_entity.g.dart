// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsEntity _$NewsEntityFromJson(Map<String, dynamic> json) => NewsEntity(
      news: (json['news'] as List<dynamic>?)
          ?.map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsEntityToJson(NewsEntity instance) =>
    <String, dynamic>{
      'news': instance.news,
    };

News _$NewsFromJson(Map<String, dynamic> json) => News(
      title: json['title'] as String?,
      date: json['date'] as String?,
      timeToRead: json['time_to_read'] as String?,
      imagePath: json['image_path'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'title': instance.title,
      'date': instance.date,
      'time_to_read': instance.timeToRead,
      'image_path': instance.imagePath,
      'items': instance.items,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      title: json['title'] as String?,
      text: json['text'] as String?,
      imagePath: json['image_path'] as String?,
      subtext: json['subtext'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'image_path': instance.imagePath,
      'subtext': instance.subtext,
    };
