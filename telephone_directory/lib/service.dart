import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'model.dart';

class DataBase {
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'planets1.db'),
      version: 1,
      onCreate: (Database db, int version) async {

        await db.execute(
          "CREATE TABLE planets1(id INTEGER PRIMARY KEY , name TEXT NOT NULL,phone_number INTEGER NOT NULL)",
        );

      },
    );
  }

// insert data
  Future<int> insertPlanets(List<Planets> planets) async {
    int result = 0;
    final Database db = await initializedDB();
    for (var planet in planets) {
      result = await db.insert('planets1', planet.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    return result;
  }

// retrieve data
  Future<List<Planets>> retrievePlanets() async {
    final Database db = await initializedDB();
    final List<Map<String, Object?>> queryResult = await db.query('planets1');
    return queryResult.map((e) => Planets.fromMap(e)).toList();
  }

// delete user
  Future<void> deletePlanet(int id) async {
    final db = await initializedDB();
    await db.delete(
      'planets1',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
