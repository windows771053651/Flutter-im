import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'db_constant.dart';

abstract class DatabaseProvider<T> {
  Database _instance;

  Database get instance => _instance;

  Future<Database> get database async {
    if (_instance == null) {
      var path = await getDatabasesPath();
      print("database path:$path");
      _instance = await openDatabase(
        path + "/" + DBConstant.DATABASE_NAME,
        onCreate: createDatabase,
        version: DBConstant.VERSION,
      );
    }
    return _instance;
  }

  createDatabase(Database db, int version);

  closeDB();

  Future<int> insert(T bean);

  Future<int> delete(String userId);

  Future<int> update(String userId, T bean);

  Future<List<Map<String, dynamic>>> query(String userId);
}