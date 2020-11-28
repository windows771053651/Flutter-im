/// 聊天消息会话列表
class ChatSessionTable {
  static const String MESSAGE_SESSION_TABLE = "MessageSession";

  static const String COLUMN_NAME_NAME = "name";
  static const String COLUMN_NAME_AVATAR = "avatar";
  static const String COLUMN_NAME_TYPE = "type";
  static const String COLUMN_NAME_DATETIME = "time";
  static const String COLUMN_NAME_READ = "read";
  static const String COLUMN_NAME_USER_ID = "userId";
  static const String COLUMN_NAME_LAST_CHAT_MESSAGE = "lastChatMessage";

  /// 创建聊天消息会话列表
  static final String sqlCreateTableMessageSession =
                          """ 
                            CREATE TABLE IF NOT EXISTS $MESSAGE_SESSION_TABLE(
                              id INTEGER PRIMARY KEY AUTOINCREMENT,
                              $COLUMN_NAME_NAME TEXT,
                              $COLUMN_NAME_AVATAR TEXT,
                              $COLUMN_NAME_TYPE INTEGER ,
                              $COLUMN_NAME_DATETIME INTEGER,
                              $COLUMN_NAME_READ BOOL,
                              $COLUMN_NAME_USER_ID TEXT,
                              $COLUMN_NAME_LAST_CHAT_MESSAGE TEXT
                            );
                          """;
}