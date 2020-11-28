/// 朋友圈，评论表
class FriendsUpdatesCommentTable {
  static const String FRIENDS_UPDATES_COMMENT_TABLE = "friends_updates_comment";

  static const String COLUMN_NAME_USER_NAME = "userName";

  static const String COLUMN_NAME_COMMENT = "content";

  static const String COLUMN_NAME_BLOG_ID = "blogId";

  static final String sqlCreateTableFriendsUpdates=
  """ 
                            CREATE TABLE IF NOT EXISTS $FRIENDS_UPDATES_COMMENT_TABLE(
                              id INTEGER PRIMARY KEY AUTOINCREMENT,
                              $COLUMN_NAME_USER_NAME TEXT,
                              $COLUMN_NAME_COMMENT TEXT,
                              $COLUMN_NAME_BLOG_ID TEXT
                            );
                          """;
}