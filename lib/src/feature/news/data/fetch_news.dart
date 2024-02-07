import 'package:flutter/services.dart';
import 'package:quiz_test/src/feature/news/domain/models/news_entity/news_entity.dart';


Future<NewsEntity> fetchNews() async {
  final String responce =
      await rootBundle.loadString('assets/jsons/news.json');
      // log(responce);
  return newsEntityFromJson(responce);
}
