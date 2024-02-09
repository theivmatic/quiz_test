// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizEntity _$QuizEntityFromJson(Map<String, dynamic> json) => QuizEntity(
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizEntityToJson(QuizEntity instance) =>
    <String, dynamic>{
      'questions': instance.questions,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      question: json['question'] as String?,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
    };

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      answerText: json['answer_text'] as String?,
      isCorrect: json['is_correct'] as bool?,
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'answer_text': instance.answerText,
      'is_correct': instance.isCorrect,
    };
