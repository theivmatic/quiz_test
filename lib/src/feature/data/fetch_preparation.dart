import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:quiz_test/src/feature/domain/models/preparation_entity.dart';

Future<PreparationEntity> fetchPreparation() async {
  final String responce =
      await rootBundle.loadString('assets/jsons/preparation_slovo_pacana.json');
      // log(responce);
  return preparationEntityFromJson(responce);
}
