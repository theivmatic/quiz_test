import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'news_entity.g.dart';

NewsEntity newsEntityFromJson(String str) =>
    NewsEntity.fromJson(jsonDecode(str) as Map<String, dynamic>);
    
@JsonSerializable()
class NewsEntity {
  @JsonKey(name: 'news')
  List<News>? news;

  NewsEntity({
    this.news,
  });

  factory NewsEntity.fromJson(Map<String, dynamic> json) => _$NewsEntityFromJson(json);
}

@JsonSerializable()
class News {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'time_to_read')
  String? timeToRead;
  @JsonKey(name: 'image_path')
  String? imagePath;
  @JsonKey(name: 'items')
  List<Item>? items;

  News({
    this.title,
    this.date,
    this.timeToRead,
    this.imagePath,
    this.items,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}

@JsonSerializable()
class Item {
  @JsonKey(name: 'title')
  dynamic title;
  @JsonKey(name: 'text')
  String? text;
  @JsonKey(name: 'image_path')
  String? imagePath;
  @JsonKey(name: 'subtext')
  String? subtext;

  Item({
    this.title,
    this.text,
    this.imagePath,
    this.subtext,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
