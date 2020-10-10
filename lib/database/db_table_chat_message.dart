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
      DBConstant.COLUMN_NAME_USER_ID: bean.userId,
      DBConstant.COLUMN_NAME_MESSAGE_TYPE: bean.chatMessageType.index,
      DBConstant.COLUMN_NAME_AVATAR_URL: bean.avatarUrl,
      DBConstant.COLUMN_NAME_NAME: bean.name,
      DBConstant.COLUMN_NAME_TIME: bean.time,
      DBConstant.COLUMN_NAME_PICTURE_URL: bean.picturePath,
      DBConstant.COLUMN_NAME_VOICE_URL: bean.voiceUrl,
      DBConstant.COLUMN_NAME_LOCATION: bean.location,
      DBConstant.COLUMN_NAME_IN_OUT_TYPE: bean.inOutType.index,
      DBConstant.COLUMN_NAME_CONTENT: bean.chatMessage,
      DBConstant.COLUMN_NAME_NATIVE_PICTURE_URI: bean.nativePicturePath,
    };
    return db.insert(DBConstant.MESSAGE_Table, params);
  }

  @override
  Future<int> delete(String userId) async {
    Database db = await database;
    return db.delete(
      DBConstant.MESSAGE_Table,
      where: "${DBConstant.COLUMN_NAME_USER_ID} = ?",
      whereArgs: [userId],
    );
  }

  @override
  Future<int> update(String userId, ChatMessageBean bean) {

  }

  @override
  Future<List<Map<String, dynamic>>> query(String userId) async {
    print("userId:$userId");
    Database db = await database;
    return db.query(
      DBConstant.MESSAGE_Table,
      where: "${DBConstant.COLUMN_NAME_USER_ID} = ?",
      whereArgs: [userId],
    );
  }

  @override
  void closeDB() {
    if (instance != null) {
      instance.close();
    }
  }
}