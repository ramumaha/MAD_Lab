

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'model.dart';

class DataBase {
  //create
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'logins.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE logins(username TEXT NOT NULL,password TEXT NOT NULL)",
        );
      },
    );
  }
  //insert

  Future<int> insertPlanets(List<Logins> logins) async {
    int result = 0;
    final Database db = await initializedDB();
    for (var login in logins) {
      result = await db.insert('logins', login.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    return result;
  }

  //search
  Future<int?> queryRows(name) async {
    final Database db = await initializedDB();
    return Sqflite.firstIntValue(await db.rawQuery("SELECT COUNT(*) FROM logins where username = '$name'"));
  }

  //retrive all

  Future<List<Logins>> retrievePlanets() async {
    final Database db = await initializedDB();
    final List<Map<String, Object?>> queryResult = await db.query('logins');
    return queryResult.map((e) => Logins.fromMap(e)).toList();
  }


}
