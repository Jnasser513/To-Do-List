import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:to_do_list/src/data/to_do.dart';
import 'dart:core';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ToDoDatabase {
  ToDoDatabase._();

  static final ToDoDatabase db = ToDoDatabase._();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await getDatabaseInstance();
    return _database!;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "todo.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("""CREATE TABLE todo(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, amount REAL, type INTEGER, date TEXT) """);
    });
  }

  Future<int> insertTransaction(ToDo item) async {
    final db = await database;
    return db.insert(
      'todo',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ToDo>> getTransactions() async {
    final db = await database;
    var response = await db.query("todo");
    List<ToDo> list = response.isNotEmpty
        ? response.map((e) => ToDo.fromMap(e)).toList()
        : [];
    return list;
  }

  Future<void> deleteTransaction(int id) async {
    final db = await database;
    await db.delete(
      'todo',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
