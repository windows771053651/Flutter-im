/// 朋友圈，点赞表
class FriendsUpdatesPraiseTable {
  static const String FRIENDS_UPDATES_PRAISE_TABLE = "friends_updates_praise";

  static const String COLUMN_NAME_USER_NAME = "userName";

  static const String COLUMN_NAME_BLOG_ID = "blogId";

  static final String sqlCreateTableFriendsUpdates=
  """ 
                            CREATE TABLE IF NOT EXISTS $FRIENDS_UPDATES_PRAISE_TABLE(
                              id INTEGER PRIMARY KEY AUTOINCREMENT,
                              $COLUMN_NAME_USER_NAME TEXT,
                              $COLUMN_NAME_BLOG_ID TEXT
                            );
                          """;
}