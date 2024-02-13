import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'quizzes_entity.g.dart';

QuizzesEntity quizzesEntityFromJson(String jsonString) =>
    QuizzesEntity.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);

@JsonSerializable()
class QuizzesEntity {
  @JsonKey(name: 'quizzes')
	List<Quiz>? quizzes;

	QuizzesEntity({this.quizzes});

  factory QuizzesEntity.fromJson(Map<String, dynamic> json) => _$QuizzesEntityFromJson(json);
}

@JsonSerializable()
class Quiz {
  @JsonKey(name: 'quiz_name')
  String? quizName;
  @JsonKey(name: 'image_path')
  String? imagePath;
  @JsonKey(name: 'difficulty')
  int? difficulty;
  @JsonKey(name: 'questions')
  List<Question>? questions;

  Quiz({this.quizName, this.imagePath, this.difficulty, this.questions});

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}

@JsonSerializable()
class Question {
  @JsonKey(name: 'question')
  String? question;
  @JsonKey(name: 'answers')
  List<Answer>? answers;

  Question({this.question, this.answers});

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}

@JsonSerializable()
class Answer {
  @JsonKey(name: 'answer_text')
	String? answerText;
  @JsonKey(name: 'is_correct')
	bool? isCorrect;

	Answer({this.answerText, this.isCorrect});

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
