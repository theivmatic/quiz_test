import 'dart:io';

import 'package:quiz_test/src/feature/domain/models/quiz_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'quiz.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE quizzes(
        id INTEGER PRIMARY KEY,
        difficulty INTEGER,
        image WIDGET
      )
    ''');
  }

  Future<List<Quiz>> getQuizzes() async {
    Database db = await instance.database;
    var quizzes = await db.query('quizzes', orderBy: 'id');
    List<Quiz> quizList = quizzes.isNotEmpty ? quizzes.map((c) => Quiz.fromMap(c)).toList() : [];
    return quizList;
  }
}
