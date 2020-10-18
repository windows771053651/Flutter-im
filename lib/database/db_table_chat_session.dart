import 'package:flutter_im/chat/bean/chat_session.dart';
import 'package:sqflite/sqflite.dart';

import 'base_database_provider.dart';
import 'db_constant.dart';

/// Im聊天消息数据表
class ImSessionDatabaseProvider extends DatabaseProvider<ChatSession> {

  @override
  Future<int> insert(ChatSession bean) async {
    Future<int> future = delete(bean.userId);
    future.then((onValue) {
      print("删除session:$onValue条数据");
    });
    Database db = await database;
    Map<String, dynamic> params = {
      DBConstant.COLUMN_NAME_NAME: bean.name,
      DBConstant.COLUMN_NAME_AVATAR: bean.avatar,
      DBConstant.COLUMN_NAME_TYPE: bean.messageType.index,
      DBConstant.COLUMN_NAME_DATETIME: bean.time.millisecondsSinceEpoch,
      DBConstant.COLUMN_NAME_READ: bean.read,
      DBConstant.COLUMN_NAME_USER_ID: bean.userId,
      DBConstant.COLUMN_NAME_LAST_CHAT_MESSAGE: bean.lastChatMessageContent,
    };
    return db.insert(DBConstant.MESSAGE_SESSION_TABLE, params);
  }

  @override
  Future<int> delete(String targetUserId) async {
    Database db = await database;
    return db.delete(
      DBConstant.MESSAGE_SESSION_TABLE,
      where: "${DBConstant.COLUMN_NAME_USER_ID} = ? ",
      whereArgs: [targetUserId],
    );
  }

  @override
  Future<int> update(String targetUserId, ChatSession bean) {

  }

  @override
  Future<List<Map<String, dynamic>>> query(String targetUserId) async {
    Database db = await database;
    return db.query(
      DBConstant.MESSAGE_SESSION_TABLE,
    );
  }

  @override
  void closeDB() {
    if (instance != null) {
      instance.close();
    }
  }
}