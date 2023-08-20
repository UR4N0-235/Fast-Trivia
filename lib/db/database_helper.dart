// import 'dart:async';
// import 'dart:io';

// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseProvider {
//   DatabaseProvider._();
//   static final DatabaseProvider db = DatabaseProvider._();

//   Database? _database;

//   Future<Database> get database async {
//     if(_database != null) return _database!;
//     _database = await initDatabase();
//     return _database!;
//   }
//   initDatabase() async{
//     Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.path, "FastTrivia.db");
//     return await openDatabase(path, version: 1, onOpen: (db)=> {}, onCreate: (Database db, int version) async {
//       await db.execute("")
//     })
//   }
// }

import 'dart:convert';

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
            timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
            correct_quantity INTEGER,
            questionary_id INTEGER,
            answers TEXT
          )
        ''');
    });
  }

  Future<int> insertResponse(int questionaryId, int correctQuantity, String answers) async {
    final db = await instance.database;
    return await db.insert('questionary_response', {'questionary_id': questionaryId, 'answers': answers, 'correct_quantity': correctQuantity});
    // return await db
    //     .rawInsert('''INSERT INTO questionary_response(questionary_id, answers)
    //                   VALUES($questionaryId, $answers )
    // ''');
    //    return await db.insert('questionary_response', row);
  }

  Future<String> getAllResponsesAsJson() async {
    final db = await instance.database;
    final results = await db.query('questionary_response');

    final List<Map<String, dynamic>> responseList = List.from(results);

    final jsonList = jsonEncode(responseList);
    
    return jsonList;
  }
}
