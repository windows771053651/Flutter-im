/// 朋友圈数据表
class FriendsUpdatesTable {
  static const String FRIENDS_UPDATES_TABLE = "friends_updates";

  static const String COLUMN_NAME_USER_ID = "userId";

  static const String COLUMN_NAME_BLOG_ID = "blogId";

  static const String COLUMN_NAME_USER_NAME = "userName";

  static const String COLUMN_NAME_AVATAR_URL = "avatarUrl";

  static const String COLUMN_NAME_TITLE = "title";

  static const String COLUMN_NAME_ICONS = "icons";

  static const String COLUMN_NAME_TIME = "time";

  static const String COLUMN_NAME_PRAISED = "praised";

  /// 朋友圈帖子表
  static final String sqlCreateTableFriendsUpdates=
  """ 
                            CREATE TABLE IF NOT EXISTS $FRIENDS_UPDATES_TABLE(
                              id INTEGER PRIMARY KEY AUTOINCREMENT,
                              $COLUMN_NAME_USER_ID TEXT,
                              $COLUMN_NAME_BLOG_ID TEXT,
                              $COLUMN_NAME_USER_NAME TEXT ,
                              $COLUMN_NAME_AVATAR_URL TEXT,
                              $COLUMN_NAME_TITLE TEXT,
                              $COLUMN_NAME_ICONS TEXT,
                              $COLUMN_NAME_TIME TEXT,
                              $COLUMN_NAME_PRAISED BOOL
                            );
                          """;
}