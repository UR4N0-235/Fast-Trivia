import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'fast_trivia.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE IF NOT EXISTS questionary_response (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            timestamp TEXT,
            correct_quantity INTEGER,
            questionary_id INTEGER,
            answers TEXT
          )
        ''');
    });
  }

  Future<int> insertResponse(
      int questionaryId, int correctQuantity, String answers) async {
    final db = await instance.database;
    return await db.insert('questionary_response', {
      'questionary_id': questionaryId,
      'answers': answers,
      'timestamp': DateTime.now().toString(),
      'correct_quantity': correctQuantity
    });
  }

  Future<String> getAllResponsesAsJson() async {
    final db = await instance.database;
    final results = await db.query('questionary_response');

    final List<Map<String, dynamic>> responseList = List.from(results);

    final jsonList = jsonEncode(responseList);

    return jsonList;
  }

  clearData() async{
    final db = await instance.database;
    await db.delete('questionary_response');
  }
}
