import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'preparation_entity.g.dart';

PreparationEntity preparationEntityFromJson(String str) =>
    PreparationEntity.fromJson(jsonDecode(str));

@JsonSerializable()
class PreparationEntity {
  String? title;
  List<Fact>? facts;
  String? subtitle;
  @JsonKey(name: 'small_facts')
  List<SmallFact>? smallFacts;

  PreparationEntity({this.title, this.facts, this.subtitle, this.smallFacts});

  factory PreparationEntity.fromJson(Map<String, dynamic> json) =>
      _$PreparationEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PreparationEntityToJson(this);
}

@JsonSerializable()
class Fact {
  String? number;
  String? text;
  @JsonKey(name: 'image_path')
  String? imagePath;
  String? subtext;

  Fact({this.number, this.text, this.imagePath, this.subtext});

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);
}

@JsonSerializable()
class SmallFact {
  String? text;

  SmallFact({this.text});

  factory SmallFact.fromJson(Map<String, dynamic> json) =>
      _$SmallFactFromJson(json);
}
