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
      DBConstant.columnNameMessageType: bean.chatMessageType.index,
      DBConstant.columnNameAvatarUrl: bean.avatarUrl,
      DBConstant.columnNameName: bean.name,
      DBConstant.columnNameTime: bean.time,
      DBConstant.columnNamePictureUrl: bean.picturePath,
      DBConstant.columnNameVoiceUrl: bean.voiceUrl,
      DBConstant.columnNameLocation: bean.location,
      DBConstant.columnNameInOutType: bean.inOutType.index,
      DBConstant.columnNameMessageContent: bean.chatMessage,
      DBConstant.columnNameNativePictureUri: bean.nativePicturePath,
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