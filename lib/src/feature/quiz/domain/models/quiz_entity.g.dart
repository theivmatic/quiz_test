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
      id: json['id'] as int?,
      question: json['question'] as String?,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answers': instance.answers,
    };

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      firstAnswer: json['first_answer'] as String?,
      secondAnswer: json['second_answer'] as String?,
      thirdAnswer: json['third_answer'] as String?,
      fourthAnswer: json['fourth_answer'] as String?,
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'first_answer': instance.firstAnswer,
      'second_answer': instance.secondAnswer,
      'third_answer': instance.thirdAnswer,
      'fourth_answer': instance.fourthAnswer,
    };
