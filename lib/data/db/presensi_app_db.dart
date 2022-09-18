import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PresensiAppDb {
  Future<Database>? db;

  PresensiAppDb(String path) {
    db = openDatabase(join(path, 'fpd.db'), version: 1,
        onCreate: (dbs, version) async {
      await dbs.execute('''
  CREATE TABLE IF NOT EXISTS auth (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    accessToken TEXT NULL,
    refreshToken TEXT NULL,
    createdAt integer
  )
''');
      await dbs.execute('''
CREATE TABLE IF NOT EXISTS firstTime (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    firstTime INTEGER NULL,
    createdAt integer
  )
''');
    });
  }

  Future close() async {
    db?.then((value) => value.close());
  }
}
