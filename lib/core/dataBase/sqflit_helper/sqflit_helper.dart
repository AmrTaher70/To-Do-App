import 'package:sqflite/sqflite.dart';

import '../../../features/auth/task/data/model_task.dart';

class SqfliteHelper {
  late Database db;

  Future<void> initDB() async {
    db = await openDatabase(
      'task.db',
      version: 1,
      onCreate: (Database db, int v) async {
        await db.execute('''
          CREATE TABLE Tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT ,
            note TEXT ,
            date TEXT,
            startTime TEXT,
            endTime TEXT,
            color INTEGER,
            isCompleted INTEGER
          )''');
        print('Db created successfully');
      },
    );
    print('Db opened successfully');
  }

  Future<List<Map<String, Object?>>> getFromDB() async {
    return await db.rawQuery('SELECT * FROM Tasks');
  }

  Future<int> insertToDB(ModelTaskManager modelTaskManager) async {
    return await db.rawInsert(
      '''INSERT INTO Tasks(title, note, date, startTime, endTime, color, isCompleted) VALUES (?, ?, ?, ?, ?, ?, ?)''',
      [
        modelTaskManager.title,
        modelTaskManager.note,
        modelTaskManager.date,
        modelTaskManager.startTime,
        modelTaskManager.endTime,
        modelTaskManager.color,
        modelTaskManager.isCompleted,
      ],
    );
  }

  Future<int> updateDB(int id) async {
    return await db.rawUpdate(
      'UPDATE Tasks SET isCompleted = ? WHERE id = ?',
      [1, id],
    );
  }

  Future<int> deleteDB(int id) async {
    return await db.rawDelete(
      'DELETE FROM Tasks WHERE id = ?',
      [id],
    );
  }
}
