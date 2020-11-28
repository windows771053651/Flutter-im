/// 朋友圈，超链item表
class FriendsUpdatesLinkTable {
  static const String FRIENDS_UPDATES_LINK_TABLE = "friends_updates_link";

  static const String COLUMN_NAME_ICON = "icon";

  static const String COLUMN_NAME_TITLE = "title";

  static const String COLUMN_NAME_SUB_TITLE = "subTitle";

  static const String COLUMN_NAME_LINK = "link";

  static const String COLUMN_NAME_BLOG_ID = "blogId";

  static final String sqlCreateTableFriendsUpdates=
  """ 
                            CREATE TABLE IF NOT EXISTS $FRIENDS_UPDATES_LINK_TABLE(
                              id INTEGER PRIMARY KEY AUTOINCREMENT,
                              $COLUMN_NAME_ICON TEXT,
                              $COLUMN_NAME_TITLE TEXT,
                              $COLUMN_NAME_SUB_TITLE TEXT,
                              $COLUMN_NAME_LINK TEXT,
                              $COLUMN_NAME_BLOG_ID TEXT
                            );
                          """;
}