import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'quiz_entity.g.dart';

QuizEntity quizEntityFromJson(String jsonString) =>
    QuizEntity.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);

@JsonSerializable()
class QuizEntity {
	List<Question>? questions;

	QuizEntity({this.questions});

  factory QuizEntity.fromJson(Map<String, dynamic> json) => _$QuizEntityFromJson(json);
}

@JsonSerializable()
class Question {
  String? question;
  List<Answer>? answers;

  Question({this.question, this.answers});

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}

@JsonSerializable()
class Answer {
	String? answerText;
	bool? isCorrect;

	Answer({this.answerText, this.isCorrect});

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
