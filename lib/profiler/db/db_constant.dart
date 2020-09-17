class DBConstant {
  /// 数据库名
  static final String databaseName = "FlutterImDB";

  /// 数据库版本
  static final int databaseVersion = 1;

  /// 聊天消息表
  static final String messageTable = "Message";
  static final String messageTableColumnName1 = "chatMessageType";
  static final String messageTableColumnName2 = "avatarUrl";
  static final String messageTableColumnName3 = "name";
  static final String messageTableColumnName4 = "time";
  static final String messageTableColumnName5 = "picturePath";
  static final String messageTableColumnName6 = "voiceUrl";
  static final String messageTableColumnName7 = "location";
  static final String messageTableColumnName8 = "inOutType";
  static final String messageTableColumnName9 = "chatMessage";
  static final String messageTableColumnName10 = "nativePicturePath";

  /// 创建聊天消息表
  static final String sqlCreateTableMessage =
                          """ 
                            CREATE TABLE IF NOT EXISTS $messageTable(
                              id INTEGER PRIMARY KEY AUTOINCREMENT,
                              $messageTableColumnName1 INTEGER,
                              $messageTableColumnName2 TEXT,
                              $messageTableColumnName3 TEXT,
                              $messageTableColumnName4 TEXT,
                              $messageTableColumnName5 TEXT,
                              $messageTableColumnName6 TEXT,
                              $messageTableColumnName7 TEXT,
                              $messageTableColumnName8 INTEGER,
                              $messageTableColumnName9 TEXT,
                              $messageTableColumnName10 TEXT
                            );
                          """;
}