import 'package:flutter/services.dart';
import 'package:quiz_test/src/feature/quiz/domain/models/quizzes_entity.dart';


Future<QuizzesEntity> fetchQuizzes() async {
  final responce =
      await rootBundle.loadString('assets/jsons/quiz.json');
  return quizzesEntityFromJson(responce);
}
