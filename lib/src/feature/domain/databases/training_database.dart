import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TrainingDatabase {
  static final TrainingDatabase instance = TrainingDatabase._init();

  static Database? _database;
  List wholeDataList = [];

  TrainingDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('trainig.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const jsonType = 'JSON NOT NULL';

    await db.execute('''
CREATE TABLE Training (
  id $idType,
  TrainingJson $jsonType
)
''');
  }

  Future addJson({wholeData}) async {
    final db = await database;
    await db.insert("Training", {"TrainingJson": wholeData});
    log('$wholeData Added to database succesfully');
    return 'added';
  }

  Future readAllJson() async {
    final db = await database;
    final allJson = await db.query("Training");
    wholeDataList = allJson;
    log('$wholeDataList');
    return 'succesfully read';
  }
}
