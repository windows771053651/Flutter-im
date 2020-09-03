import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/horizontal_line.dart';
import 'package:flutter_im/common/common_text_item.dart';
import 'package:flutter_im/personal/sub_view/personal_header.dart';

class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          HorizontalLine(height: 10,),
          PersonalHeader(),
          HorizontalLine(height: 10,),
          CommonTextItemView(leftIconAssetPath: "images/icon_me_friends.png", leftTitle: "好友动态"),
          HorizontalLine(height: 10,),
          CommonTextItemView(leftIconAssetPath: "images/icon_me_message.png", leftTitle: "消息管理"),
          HorizontalLine(),
          CommonTextItemView(leftIconAssetPath: "images/icon_photo.png", leftTitle: "我的相册"),
          HorizontalLine(),
          CommonTextItemView(leftIconAssetPath: "images/icon_file.png", leftTitle: "我的文件"),
          HorizontalLine(),
          CommonTextItemView(leftIconAssetPath: "images/icon_me_service.png", leftTitle: "联系客服"),
          HorizontalLine(height: 10,),
          CommonTextItemView(leftIconAssetPath: "images/icon_me_clear.png", leftTitle: "清理缓存"),
        ],
      ),
    );
  }
}