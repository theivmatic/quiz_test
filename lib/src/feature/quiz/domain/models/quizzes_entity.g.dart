// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizzes_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizzesEntity _$QuizzesEntityFromJson(Map<String, dynamic> json) =>
    QuizzesEntity(
      quizzes: (json['quizzes'] as List<dynamic>?)
          ?.map((e) => Quiz.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizzesEntityToJson(QuizzesEntity instance) =>
    <String, dynamic>{
      'quizzes': instance.quizzes,
    };

Quiz _$QuizFromJson(Map<String, dynamic> json) => Quiz(
      quizName: json['quiz_name'] as String?,
      imagePath: json['image_path'] as String?,
      difficulty: json['difficulty'] as int?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'quiz_name': instance.quizName,
      'image_path': instance.imagePath,
      'difficulty': instance.difficulty,
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
