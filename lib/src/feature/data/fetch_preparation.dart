import 'dart:convert';

import 'package:flutter/services.dart';

Future<void> fetchPreparation() async {
  final String responce = await rootBundle.loadString('assets/jsons/preparation_slovo_pacana.json');
  final data = await json.decode(responce);
}