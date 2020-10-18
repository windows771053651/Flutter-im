import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/bottom_sheet_dialog.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/constants/constants.dart';
import 'package:flutter_im/router/page_id.dart';


class FriendsUpdatesHeader extends StatefulWidget {

  final String name;

  final String avatarUrl;

  FriendsUpdatesHeader({
    @required this.name,
    @required this.avatarUrl,
  });

  @override
  State createState() => _FriendsUpdatesHeaderState();
}

class _FriendsUpdatesHeaderState extends State<FriendsUpdatesHeader> {

  File _backgroundImageFile = File("");

  /// 是否是本地图片
  bool _isBackgroundNativeResource = false;

  @override
  Widget build(BuildContext context) {
    return _getBackgroundWidget();
  }

  Widget _getBackgroundWidget() {
    return TouchCallBack(
      normalColor: Colors.white,
      pressedColor: Colors.white,
      child: AspectRatio(
        aspectRatio: Constants.friendsUpdatesHeaderBgRatio,
        child: _getHeaderBackgroundImageWidget(),
      ),
      callBack: () {
        _displayHeaderBackgroundSelectDialog();
      },
    );
  }

  Widget _getHeaderBackgroundImageWidget() {
    return _isBackgroundNativeResource
        ? Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(_backgroundImageFile),
          fit: BoxFit.cover,
        ),
      ),)
        : Image.asset(Constants.friendsUpdatesHeaderBg, fit: BoxFit.cover,);
  }

  /// 显示背景图片选择对话框
  void _displayHeaderBackgroundSelectDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          var list = List();
          list.add('更换相册封面');
          return BottomSheetWidget(
            list: list,
            onItemClickListener: (index) async {
              Navigator.pop(context);
              Future future = Navigator.of(context).pushNamed(PageId.GROUP_CHAT_CHAT_BACKGROUND_SETTINGS_PAGE, arguments: "更换相册封面");
              future.then((onValue) {
                if (onValue != null && onValue.existsSync()) {
                  _backgroundImageFile = onValue;
                  setState(() {
                    _isBackgroundNativeResource = true;
                  });
                }
              });
            },
          );
        },
    );
  }

}