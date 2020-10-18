import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'db_constant.dart';

abstract class DatabaseProvider<T> {
  Database _instance;

  Database get instance => _instance;

  Future<Database> get database async {
    if (_instance == null) {
      var path = await getDatabasesPath();
      _instance = await openDatabase(
        path + "/" + DBConstant.DATABASE_NAME,
        onCreate: _createDatabase,
        version: DBConstant.VERSION,
      );
    }
    return _instance;
  }

  _createDatabase(Database db, int version) {
    db.execute(DBConstant.sqlCreateTableMessage);
    db.execute(DBConstant.sqlCreateTableMessageSession);
  }

  closeDB();

  Future<int> insert(T bean);

  Future<int> delete(String targetUserId);

  Future<int> update(String targetUserId, T bean);

  Future<List<Map<String, dynamic>>> query(String targetUserId);
}