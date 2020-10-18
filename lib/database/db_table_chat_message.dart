import 'package:flutter_im/constants/constants.dart';
import 'package:sqflite/sqflite.dart';

import 'base_database_provider.dart';
import 'db_constant.dart';
import 'package:flutter_im/chat/bean/chat_message_bean.dart';

/// Im聊天消息数据表
class ImDatabaseProvider extends DatabaseProvider<ChatMessageBean> {

  @override
  Future<int> insert(ChatMessageBean bean) async {
    Database db = await database;
    Map<String, dynamic> params = {
      DBConstant.COLUMN_NAME_TARGET_USER_ID: bean.targetUserId,
      DBConstant.COLUMN_NAME_TARGET_AVATAR_URL: bean.targetAvatarUrl,
      DBConstant.COLUMN_NAME_TARGET_NAME: bean.targetName,
      DBConstant.COLUMN_NAME_CURRENT_USER_ID: bean.currentUserId,
      DBConstant.COLUMN_NAME_CURRENT_AVATAR_URL: bean.currentAvatarUrl,
      DBConstant.COLUMN_NAME_CURRENT_NAME: bean.currentName,
      DBConstant.COLUMN_NAME_MESSAGE_TYPE: bean.chatMessageType.index,
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
  Future<int> delete(String targetUserId) async {
    String currentUserId = "${Constants.userName.hashCode}";
    Database db = await database;
    return db.delete(
      DBConstant.MESSAGE_Table,
      where: "${DBConstant.COLUMN_NAME_TARGET_USER_ID} = ? AND ${DBConstant.COLUMN_NAME_CURRENT_USER_ID} = ? ",
      whereArgs: [targetUserId, currentUserId],
    );
  }

  @override
  Future<int> update(String targetUserId, ChatMessageBean bean) {

  }

  @override
  Future<List<Map<String, dynamic>>> query(String targetUserId) async {
    String currentUserId = "${Constants.userName.hashCode}";
    Database db = await database;
    return db.query(
      DBConstant.MESSAGE_Table,
      where: "${DBConstant.COLUMN_NAME_TARGET_USER_ID} = ? AND ${DBConstant.COLUMN_NAME_CURRENT_USER_ID} = ? ",
      whereArgs: [targetUserId, currentUserId],
    );
  }

  @override
  void closeDB() {
    if (instance != null) {
      instance.close();
    }
  }
}