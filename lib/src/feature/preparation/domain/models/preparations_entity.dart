import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'preparations_entity.g.dart';

PreparationsEntity preparationEntityFromJson(String str) =>
    PreparationsEntity.fromJson(jsonDecode(str) as Map<String, dynamic>);

@JsonSerializable() 
class PreparationsEntity {
  List<Preparation>? preparations;

  PreparationsEntity({this.preparations});

  factory PreparationsEntity.fromJson(Map<String, dynamic> json) => _$PreparationsEntityFromJson(json);
}

@JsonSerializable() 
class Preparation {
  @JsonKey(name: 'preparation_name')
	String? preparationName;
  @JsonKey(name: 'image_path')
	String? imagePath;
  @JsonKey(name: 'title')
	String? title;
  @JsonKey(name: 'facts')
	List<Fact>? facts;
  @JsonKey(name: 'subtitle')
	String? subtitle;
  @JsonKey(name: 'small_facts')
	List<SmallFact>? smallFacts;

	Preparation({
		this.preparationName, 
		this.imagePath, 
		this.title, 
		this.facts, 
		this.subtitle, 
		this.smallFacts, 
	});

  factory Preparation.fromJson(Map<String, dynamic> json) => _$PreparationFromJson(json);
}

@JsonSerializable() 
class Fact {
  @JsonKey(name: 'number')
	String? number;
  @JsonKey(name: 'text')
	String? text;
  @JsonKey(name: 'image_path')
	String? imagePath;
  @JsonKey(name: 'subtext')
	String? subtext;

	Fact({this.number, this.text, this.imagePath, this.subtext});

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);
}

@JsonSerializable() 
class SmallFact {
  @JsonKey(name: 'text')
  String? text;

  SmallFact({this.text});

  factory SmallFact.fromJson(Map<String, dynamic> json) => _$SmallFactFromJson(json);
}
