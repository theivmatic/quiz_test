import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'quiz_entity.g.dart';

QuizEntity quizEntityFromJson(String jsonString) =>
    QuizEntity.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);

@JsonSerializable()
class QuizEntity {
  List<Question>? questions;

  QuizEntity({
    this.questions,
  });

  factory QuizEntity.fromJson(Map<String, dynamic> json) =>
      _$QuizEntityFromJson(json);
}

@JsonSerializable()
class Question {
  int? id;
  String? question;
  List<Answer>? answers;

  Question({
    this.id,
    this.question,
    this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

@JsonSerializable()
class Answer {
  @JsonKey(name: 'first_answer')
  String? firstAnswer;
  @JsonKey(name: 'second_answer')
  String? secondAnswer;
  @JsonKey(name: 'third_answer')
  String? thirdAnswer;
  @JsonKey(name: 'fourth_answer')
  String? fourthAnswer;

  Answer({
    this.firstAnswer,
    this.secondAnswer,
    this.thirdAnswer,
    this.fourthAnswer,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
