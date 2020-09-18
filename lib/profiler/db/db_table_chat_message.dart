import 'package:sqflite/sqflite.dart';

import 'base_database_provider.dart';
import 'db_constant.dart';
import 'package:flutter_im/chat/bean/chat_message_bean.dart';

/// Im聊天消息数据表
class ImDatabaseProvider extends DatabaseProvider<ChatMessageBean> {

  @override
  createDatabase(Database db, int version) {
    db.execute(DBConstant.sqlCreateTableMessage);
  }

  @override
  Future<int> insert(ChatMessageBean bean) async {
    Database db = await database;
    Map<String, dynamic> params = {
      DBConstant.messageTableColumnName1: bean.chatMessageType.index,
      DBConstant.messageTableColumnName2: bean.avatarUrl,
      DBConstant.messageTableColumnName3: bean.name,
      DBConstant.messageTableColumnName4: bean.time,
      DBConstant.messageTableColumnName5: bean.picturePath,
      DBConstant.messageTableColumnName6: bean.voiceUrl,
      DBConstant.messageTableColumnName7: bean.location,
      DBConstant.messageTableColumnName8: bean.inOutType.index,
      DBConstant.messageTableColumnName9: bean.chatMessage,
      DBConstant.messageTableColumnName10: bean.nativePicturePath,
    };
    return db.insert(DBConstant.messageTable, params);
  }

  @override
  Future<int> delete(String userId) async {
    Database db = await database;
    return db.delete(DBConstant.messageTable);
  }

  @override
  Future<int> update(ChatMessageBean bean) {

  }

  @override
  Future<List<Map<String, dynamic>>> query() async {
    Database db = await database;
    return db.query(DBConstant.messageTable);
  }

  @override
  void closeDB() {
    if (instance != null) {
      instance.close();
    }
  }
}