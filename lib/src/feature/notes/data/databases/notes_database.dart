import 'package:path/path.dart';
import 'package:quiz_test/src/feature/notes/domain/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
      // onUpgrade: _onUpgrade,
    );
  }

  Future<dynamic> _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    // const boolType = 'BOOLEAN NOT NULL';

    await db.execute('''
CREATE TABLE $tableNotes (
  ${NoteFields.id} $idType,
  ${NoteFields.movieTitle} $textType,
  ${NoteFields.dutarion} $textType,
  ${NoteFields.comment} $textType,
  ${NoteFields.url} $textType,
  ${NoteFields.movieImage} $textType
)
    ''');
  }

  // void _onUpgrade(Database db, int oldVersion, int newVersion) {
  //   if (oldVersion < 2) {
  //     db.execute(
  //       'ALTER TABLE $tableNotes ADD COLUMN isPinned BOOL DEFAULT false;',
  //     );
  //   }
  // }

  Future<Note> create(Note note) async {
    final db = await instance.database;

    final id = await db.insert(tableNotes, note.toJson());
    return note.copy(id: id);
  }

  Future<Note> readNote({required int id}) async {
    final db = await instance.database;

    final maps = await db.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;

    final result = await db.query(tableNotes);

    return result.map(Note.fromJson).toList();
  }

  Future<int> update({required Note note}) async {
    final db = await instance.database;

    return db.update(
      tableNotes,
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete({required int id}) async {
    final db = await instance.database;

    return db.delete(
      tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<dynamic> close() async {
    final db = await instance.database;

    await db.close();
  }
}
