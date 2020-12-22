import 'package:flutter_im/database/table/chat_message_table.dart';
import 'package:flutter_im/database/table/chat_session_table.dart';
import 'package:flutter_im/database/table/friends_updates_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class DatabaseProvider<T> {

  /// 数据库名
  static const String DATABASE_NAME = "FlutterImDB";

  /// 数据库版本
  static const int VERSION = 1;

  Database _instance;

  Database get instance => _instance;

  Future<Database> get database async {
    if (_instance == null) {
      var path = await getDatabasesPath();
      _instance = await openDatabase(
        path + "/" + DATABASE_NAME,
        onCreate: _createDatabase,
        version: VERSION,
      );
    }
    return _instance;
  }

  _createDatabase(Database db, int version) {
    db.execute(ChatMessageTable.sqlCreateTableMessage);
    db.execute(ChatSessionTable.sqlCreateTableMessageSession);
    db.execute(FriendsUpdatesTable.sqlCreateTableFriendsUpdates);
  }

  closeDB();

  Future<int> insert(T bean);

  Future<int> delete(String targetUserId);

  Future<int> update(String targetUserId, T bean);

  Future<List<Map<String, dynamic>>> query(String targetUserId);
}