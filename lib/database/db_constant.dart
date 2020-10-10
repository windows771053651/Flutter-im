class DBConstant {
  /// 数据库名
  static const String DATABASE_NAME = "FlutterImDB";

  /// 数据库版本
  static const int VERSION = 1;

  /// 聊天消息表
  static const String MESSAGE_Table = "Message";
  static const String COLUMN_NAME_USER_ID = "userId";
  static const String COLUMN_NAME_MESSAGE_TYPE = "chatMessageType";
  static const String COLUMN_NAME_AVATAR_URL = "avatarUrl";
  static const String COLUMN_NAME_NAME = "name";
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
                              $COLUMN_NAME_USER_ID TEXT,
                              $COLUMN_NAME_MESSAGE_TYPE INTEGER,
                              $COLUMN_NAME_AVATAR_URL TEXT,
                              $COLUMN_NAME_NAME TEXT,
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