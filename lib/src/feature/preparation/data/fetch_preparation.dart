import 'package:flutter/services.dart';
import 'package:quiz_test/src/feature/preparation/domain/models/preparations_entity.dart';

Future<PreparationsEntity> fetchPreparations() async {
  final responce =
      await rootBundle.loadString('assets/jsons/preparation.json');
  return preparationsEntityFromJson(responce);
}
