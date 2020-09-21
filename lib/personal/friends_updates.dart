import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/personal/sub_view/friends_updates_header.dart';
import 'package:flutter_im/personal/sub_view/friends_updates_item.dart';

import 'bean/friends_updates_bean.dart';

class FriendsUpdates extends StatefulWidget {
  @override
  State createState() => _FriendsUpdatesState();
}

class _FriendsUpdatesState extends State<FriendsUpdates> {

  bool _isFirst = true;

  String _name;

  String _avatarUrl;

  List<FriendsUpdatesBean> dataResources;

  void _initParams(BuildContext context) {
    List<String> arguments = ModalRoute.of(context).settings.arguments;
    if (arguments != null && arguments.length == 2) {
      _name = arguments[0];
      _avatarUrl = arguments[1];
      dataResources = getFriendsUpdatesDataResource();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirst) {
      _isFirst = false;
      _initParams(context);
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: dataResources.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return FriendsUpdatesHeader(
              name: _name,
              avatarUrl: _avatarUrl,
            );
          } else {
            return FriendsUpatesItem(dataResources[index - 1]);
          }
        },
      ),
    );
  }
}