class DBConstant {
  /// 数据库名
  static final String databaseName = "FlutterImDB";

  /// 数据库版本
  static final int databaseVersion = 1;

  /// 聊天消息表
  static final String messageTable = "Message";
  static final String columnNameMessageType = "chatMessageType";
  static final String columnNameAvatarUrl = "avatarUrl";
  static final String columnNameName = "name";
  static final String columnNameTime = "time";
  static final String columnNamePictureUrl = "pictureUrl";
  static final String columnNameVoiceUrl = "voiceUrl";
  static final String columnNameLocation = "location";
  static final String columnNameInOutType = "inOutType";
  static final String columnNameMessageContent = "messageContent";
  static final String columnNameNativePictureUri = "nativePictureUri";

  /// 创建聊天消息表
  static final String sqlCreateTableMessage =
                          """ 
                            CREATE TABLE IF NOT EXISTS $messageTable(
                              id INTEGER PRIMARY KEY AUTOINCREMENT,
                              $columnNameMessageType INTEGER,
                              $columnNameAvatarUrl TEXT,
                              $columnNameName TEXT,
                              $columnNameTime TEXT,
                              $columnNamePictureUrl TEXT,
                              $columnNameVoiceUrl TEXT,
                              $columnNameLocation TEXT,
                              $columnNameInOutType INTEGER,
                              $columnNameMessageContent TEXT,
                              $columnNameNativePictureUri TEXT
                            );
                          """;
}