import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'news_entity.g.dart';

NewsEntity newsEntityFromJson(String str) =>
    NewsEntity.fromJson(jsonDecode(str) as Map<String, dynamic>);

@JsonSerializable()
class NewsEntity {
  String? title;
  List<News>? news;

  NewsEntity({this.title, this.news});

  factory NewsEntity.fromJson(Map<String, dynamic> json) =>
      _$NewsEntityFromJson(json);
}

@JsonSerializable()
class News {
  @JsonKey(name: 'news_title')
  String? newsTitle;
  @JsonKey(name: 'news_text')
  String? newsText;
  @JsonKey(name: 'image_path')
  String? imagePath;
  @JsonKey(name: 'news_subtext')
  String? newsSubtext;

  News({this.newsTitle, this.newsText, this.imagePath, this.newsSubtext});

  factory News.fromJson(Map<String, dynamic> json) =>
      _$NewsFromJson(json);
}
