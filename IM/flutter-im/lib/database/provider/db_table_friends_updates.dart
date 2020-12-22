import 'package:flutter_im/database/table/friends_updates_table.dart';
import 'package:flutter_im/personal/bean/friends_updates_bean.dart';
import 'package:sqflite/sqflite.dart';

import 'base_database_provider.dart';

/// 朋友圈数据表
class FriendsUpdatesDatabaseProvider extends DatabaseProvider<FriendsUpdatesBean> {

  @override
  Future<int> insert(FriendsUpdatesBean bean) async {
    Database db = await database;
    // 朋友圈
    Map<String, dynamic> params = {
      FriendsUpdatesTable.COLUMN_NAME_USER_ID: bean.userId,
      FriendsUpdatesTable.COLUMN_NAME_BLOG_ID: bean.blogId,
      FriendsUpdatesTable.COLUMN_NAME_USER_NAME: bean.userName,
      FriendsUpdatesTable.COLUMN_NAME_AVATAR_URL: bean.avatarUrl,
      FriendsUpdatesTable.COLUMN_NAME_TITLE: bean.title,
      FriendsUpdatesTable.COLUMN_NAME_TIME: bean.time,
      FriendsUpdatesTable.COLUMN_NAME_PRAISED: bean.praised,
      FriendsUpdatesTable.COLUMN_NAME_ICONS: bean.getPictureJson(),
      FriendsUpdatesTable.COLUMN_NAME_PRAISE: bean.getPraiseJson(),
      FriendsUpdatesTable.COLUMN_NAME_COMMENTS: bean.getCommentsJson(),
      FriendsUpdatesTable.COLUMN_NAME_LINK: bean.getLinkJson(),
    };

    return db.insert(FriendsUpdatesTable.FRIENDS_UPDATES_TABLE, params);
  }

  @override
  Future<int> delete(String blogId) async {
    Database db = await database;
    return db.delete(FriendsUpdatesTable.FRIENDS_UPDATES_TABLE, where: "${FriendsUpdatesTable.COLUMN_NAME_BLOG_ID} = ? ", whereArgs: [blogId],);
  }

  @override
  Future<int> update(String targetUserId, FriendsUpdatesBean bean) async {
    Database db = await database;
    Future<List<Map<String, dynamic>>> future = db.query(FriendsUpdatesTable.FRIENDS_UPDATES_TABLE, where: "${FriendsUpdatesTable.COLUMN_NAME_BLOG_ID} = ? ", whereArgs: [bean.blogId],);
    future.then((value) {
      if (value != null && value.length > 0) {
        Map<String, dynamic> params = {
          FriendsUpdatesTable.COLUMN_NAME_PRAISED: bean.praised,
          FriendsUpdatesTable.COLUMN_NAME_ICONS: bean.getPictureJson(),
          FriendsUpdatesTable.COLUMN_NAME_PRAISE: bean.getPraiseJson(),
          FriendsUpdatesTable.COLUMN_NAME_COMMENTS: bean.getCommentsJson(),
        };

        db.update(FriendsUpdatesTable.FRIENDS_UPDATES_TABLE, params, where: "${FriendsUpdatesTable.COLUMN_NAME_BLOG_ID} = ? ", whereArgs: [bean.blogId],);
      }
    });
  }

  @override
  Future<List<Map<String, dynamic>>> query(String targetUserId) async {
    Database db = await database;
    return db.query(FriendsUpdatesTable.FRIENDS_UPDATES_TABLE,);
  }

  @override
  void closeDB() {
    if (instance != null) {
      instance.close();
    }
  }
}