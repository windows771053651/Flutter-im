import 'dart:convert';

import 'package:flutter_im/chat_biz/listener/chat_message_listener.dart';
import 'package:flutter_im/database/provider/db_table_friends_updates.dart';
import 'package:flutter_im/database/table/friends_updates_table.dart';
import 'package:flutter_im/personal/bean/friends_updates_bean.dart';
import 'package:flutter_im/utils/im_tools.dart';

class FriendsUpdatesManagerImpl {

  static FriendsUpdatesManagerImpl _instance;

  factory FriendsUpdatesManagerImpl() => _getInstance();

  static FriendsUpdatesManagerImpl get instance => _getInstance();

  FriendsUpdatesManagerImpl._internal();

  FriendsUpdatesDatabaseProvider _friendsUpdatesDatabaseProvider;

  static FriendsUpdatesManagerImpl _getInstance() {
    if (_instance == null) {
      _instance = FriendsUpdatesManagerImpl._internal();
      _instance._friendsUpdatesDatabaseProvider = FriendsUpdatesDatabaseProvider();
    }
    return _instance;
  }

  /// 插入朋友圈数据
  void insertFriendsUpdatesBeans(List<FriendsUpdatesBean> beans) {
    if (IMUtils.isListNotEmpty(beans)) {
      for (int i = beans.length - 1; i >= 0; i--) {
        insertFriendsUpdatesBean(beans[i]);
      }
    }
  }

  void insertFriendsUpdatesBean(FriendsUpdatesBean bean) {
    assert(bean != null, "朋友圈bean为null");
    /// 存入数据库
    Future future = _friendsUpdatesDatabaseProvider.insert(bean);
    future.then((onValue) {
      print("朋友圈插入session:$onValue条数据");
    });
  }

  /// 查询所有好友包括自己的朋友圈
  queryFriendsUpdatesBeans(OnFriendsUpdatesCallback onFriendsUpdatesCallback) {
    Future<List<Map<String, dynamic>>> friendsUpdatesFuture = _friendsUpdatesDatabaseProvider.query("");
    friendsUpdatesFuture.then((onValue) {
      if (onValue != null && onValue.length > 0) {
        List<FriendsUpdatesBean> friendsUpdatesBeans = List();
        for (int i = onValue.length - 1; i >= 0; i--) {
          Map<String, dynamic> bean = onValue[i];
          FriendsUpdatesBean friendsUpdatesBean = FriendsUpdatesBean(
            userName: bean[FriendsUpdatesTable.COLUMN_NAME_USER_NAME],
            blogId: bean[FriendsUpdatesTable.COLUMN_NAME_BLOG_ID],
            avatarUrl: bean[FriendsUpdatesTable.COLUMN_NAME_AVATAR_URL],
            title: bean[FriendsUpdatesTable.COLUMN_NAME_TITLE],
            time: bean[FriendsUpdatesTable.COLUMN_NAME_TIME],
            praised: bean[FriendsUpdatesTable.COLUMN_NAME_PRAISED] == 1,
            link: _analysisLink(bean[FriendsUpdatesTable.COLUMN_NAME_LINK]),
            praises: _analysisPraise(bean[FriendsUpdatesTable.COLUMN_NAME_PRAISE]),
            icons: _analysisIcons(bean[FriendsUpdatesTable.COLUMN_NAME_ICONS]),
            comments: _analysisComments(bean[FriendsUpdatesTable.COLUMN_NAME_COMMENTS]),
          );
          friendsUpdatesBeans.add(friendsUpdatesBean);
          if (onFriendsUpdatesCallback != null) {
            onFriendsUpdatesCallback(friendsUpdatesBeans);
          }
        }
      }
    });
  }

  /// 解析短链
  _analysisLink(String json) {
    if (IMUtils.isStringEmpty(json)) return null;
    return FriendsUpdatesLink.fromJson(json);
  }

  /// 解析点赞列表
  _analysisPraise(String json) {
    if (IMUtils.isStringEmpty(json)) return null;
    List<dynamic> data = jsonDecode(json);
    return List.generate(data.length, (index) => Praise.fromJson(data[index]));
  }

  /// 解析图片列表
  _analysisIcons(String json) {
    if (IMUtils.isStringEmpty(json)) return null;
    List<dynamic> data = jsonDecode(json);
    return List.generate(data.length, (index) => Picture.fromJson(data[index]));
  }

  /// 解析评论列表
  _analysisComments(String json) {
    if (IMUtils.isStringEmpty(json)) return null;
    List<dynamic> data = jsonDecode(json);
    return List.generate(data.length, (index) => Comment.fromJson(data[index]));
  }

  /// 更新朋友圈数据
  void updateFriendsUpdatesBean(String targetUserId, FriendsUpdatesBean bean) {
    assert(bean != null, "朋友圈bean为null");
    /// 存入数据库
    Future future = _friendsUpdatesDatabaseProvider.update(targetUserId, bean);
    future.then((onValue) {
      print("朋友圈更新了$onValue条数据");
    });
  }

  /// 删除对应动态
  Future<int> deleteFriendsUpdatesBean(String blogId) {
    if (IMUtils.isStringEmpty(blogId)) return null;

    return _friendsUpdatesDatabaseProvider.delete(blogId);
  }
}