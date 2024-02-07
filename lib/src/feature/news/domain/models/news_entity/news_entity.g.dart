// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsEntity _$NewsEntityFromJson(Map<String, dynamic> json) => NewsEntity(
      title: json['title'] as String?,
      news: (json['news'] as List<dynamic>?)
          ?.map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsEntityToJson(NewsEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'news': instance.news,
    };

News _$NewsFromJson(Map<String, dynamic> json) => News(
      newsTitle: json['news_title'] as String?,
      newsText: json['news_text'] as String?,
      imagePath: json['image_path'] as String?,
      newsSubtext: json['news_subtext'] as String?,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'news_title': instance.newsTitle,
      'news_text': instance.newsText,
      'image_path': instance.imagePath,
      'news_subtext': instance.newsSubtext,
    };
