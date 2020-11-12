class ChatMessageTable {
  /// 聊天消息表
  static const String MESSAGE_Table = "Message";
  static const String COLUMN_NAME_MESSAGE_TYPE = "chatMessageType";
  static const String COLUMN_NAME_TARGET_USER_ID = "targetUserId";
  static const String COLUMN_NAME_TARGET_NAME = "targetName";
  static const String COLUMN_NAME_TARGET_AVATAR_URL = "targetAvatarUrl";
  static const String COLUMN_NAME_CURRENT_USER_ID = "currentUserId";
  static const String COLUMN_NAME_CURRENT_NAME = "currentName";
  static const String COLUMN_NAME_CURRENT_AVATAR_URL = "currentAvatarUrl";
  static const String COLUMN_NAME_TIME = "time";
  static const String COLUMN_NAME_PICTURE_URL = "pictureUrl";
  static const String COLUMN_NAME_VOICE_URL = "voiceUrl";
  static const String COLUMN_NAME_LOCATION = "location";
  static const String COLUMN_NAME_IN_OUT_TYPE = "inOutType";
  static const String COLUMN_NAME_CONTENT = "messageContent";
  static const String COLUMN_NAME_NATIVE_PICTURE_URI = "nativePictureUri";

  /// 创建聊天消息表
  static final String sqlCreateTableMessage =
                          """ 
                            CREATE TABLE IF NOT EXISTS $MESSAGE_Table(
                              id INTEGER PRIMARY KEY AUTOINCREMENT,
                              $COLUMN_NAME_TARGET_USER_ID TEXT,
                              $COLUMN_NAME_TARGET_AVATAR_URL TEXT,
                              $COLUMN_NAME_TARGET_NAME TEXT,
                              $COLUMN_NAME_CURRENT_USER_ID TEXT,
                              $COLUMN_NAME_CURRENT_AVATAR_URL TEXT,
                              $COLUMN_NAME_CURRENT_NAME TEXT,
                              $COLUMN_NAME_MESSAGE_TYPE INTEGER,
                              $COLUMN_NAME_TIME TEXT,
                              $COLUMN_NAME_PICTURE_URL TEXT,
                              $COLUMN_NAME_VOICE_URL TEXT,
                              $COLUMN_NAME_LOCATION TEXT,
                              $COLUMN_NAME_IN_OUT_TYPE INTEGER,
                              $COLUMN_NAME_CONTENT TEXT,
                              $COLUMN_NAME_NATIVE_PICTURE_URI TEXT
                            );
                          """;
}