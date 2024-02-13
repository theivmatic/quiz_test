import 'package:flutter/services.dart';
import 'package:quiz_test/src/feature/preparation/domain/models/preparation_entity.dart';

Future<PreparationEntity> fetchPreparation() async {
  final responce =
      await rootBundle.loadString('assets/jsons/preparation.json');
  return preparationEntityFromJson(responce);
}
