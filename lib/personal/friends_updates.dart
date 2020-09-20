import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/personal/sub_view/friends_updates_header.dart';

class FriendsUpdates extends StatefulWidget {
  @override
  State createState() => _FriendsUpdatesState();
}

class _FriendsUpdatesState extends State<FriendsUpdates> {

  bool _isFirst = true;

  String _name;

  String _avatarUrl;

  void _initParams(BuildContext context) {
    List<String> arguments = ModalRoute.of(context).settings.arguments;
    if (arguments != null && arguments.length == 2) {
      _name = arguments[0];
      _avatarUrl = arguments[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirst) {
      _isFirst = false;
      _initParams(context);
    }

    return Scaffold(
      body: FriendsUpdatesHeader(
        name: _name,
        avatarUrl: _avatarUrl,
      ),
    );
  }
}