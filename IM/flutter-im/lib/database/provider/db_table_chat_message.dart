import 'package:flutter_im/constants/constants.dart';
import 'package:flutter_im/database/table/chat_message_table.dart';
import 'package:sqflite/sqflite.dart';

import 'base_database_provider.dart';
import 'package:flutter_im/chat/bean/chat_message_bean.dart';

/// Im聊天消息数据表
class ImDatabaseProvider extends DatabaseProvider<ChatMessageBean> {

  @override
  Future<int> insert(ChatMessageBean bean) async {
    Database db = await database;
    Map<String, dynamic> params = {
      ChatMessageTable.COLUMN_NAME_TARGET_USER_ID: bean.targetUserId,
      ChatMessageTable.COLUMN_NAME_TARGET_AVATAR_URL: bean.targetAvatarUrl,
      ChatMessageTable.COLUMN_NAME_TARGET_NAME: bean.targetName,
      ChatMessageTable.COLUMN_NAME_CURRENT_USER_ID: bean.currentUserId,
      ChatMessageTable.COLUMN_NAME_CURRENT_AVATAR_URL: bean.currentAvatarUrl,
      ChatMessageTable.COLUMN_NAME_CURRENT_NAME: bean.currentName,
      ChatMessageTable.COLUMN_NAME_MESSAGE_TYPE: bean.chatMessageType.index,
      ChatMessageTable.COLUMN_NAME_TIME: bean.time,
      ChatMessageTable.COLUMN_NAME_PICTURE_URL: bean.picturePath,
      ChatMessageTable.COLUMN_NAME_VOICE_URL: bean.voiceUrl,
      ChatMessageTable.COLUMN_NAME_LOCATION: bean.location,
      ChatMessageTable.COLUMN_NAME_IN_OUT_TYPE: bean.inOutType.index,
      ChatMessageTable.COLUMN_NAME_CONTENT: bean.chatMessage,
      ChatMessageTable.COLUMN_NAME_NATIVE_PICTURE_URI: bean.nativePicturePath,
    };
    return db.insert(ChatMessageTable.MESSAGE_Table, params);
  }

  @override
  Future<int> delete(String targetUserId) async {
    String currentUserId = "${Constants.userName.hashCode}";
    Database db = await database;
    return db.delete(
      ChatMessageTable.MESSAGE_Table,
      where: "${ChatMessageTable.COLUMN_NAME_TARGET_USER_ID} = ? AND ${ChatMessageTable.COLUMN_NAME_CURRENT_USER_ID} = ? ",
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
      ChatMessageTable.MESSAGE_Table,
      where: "${ChatMessageTable.COLUMN_NAME_TARGET_USER_ID} = ? AND ${ChatMessageTable.COLUMN_NAME_CURRENT_USER_ID} = ? ",
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