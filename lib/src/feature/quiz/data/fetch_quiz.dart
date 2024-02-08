import 'package:flutter/services.dart';
import 'package:quiz_test/src/feature/quiz/domain/models/quiz_entity.dart';


Future<QuizEntity> fetchQuiz() async {
  final responce =
      await rootBundle.loadString('assets/jsons/quiz.json');
  return quizEntityFromJson(responce);
}
