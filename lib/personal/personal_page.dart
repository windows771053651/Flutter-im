import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/horizontal_line.dart';
import 'package:flutter_im/common/common_text_item.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/personal/personal_constant.dart';
import 'package:flutter_im/personal/sub_view/personal_header.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/dialog_utils.dart';

class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          HorizontalLine(height: 10,),
          PersonalHeader(),
          HorizontalLine(height: 10,),
          CommonTextItemView(
            leftIconAssetPath: "images/icon_me_friends.png",
            leftTitle: "好友动态",
            callback: () {
              Navigator.of(context).pushNamed(PageId.GROUP_PERSONAL_FRIENDS_UPDATES, arguments: [PersonalConstant.userName, PersonalConstant.userAvatar]);
            },
          ),
          HorizontalLine(height: 10,),
          HorizontalLine(),
          CommonTextItemView(
            leftIconAssetPath: "images/icon_photo.png",
            leftTitle: "我的相册",
            callback: () {
              Navigator.of(context).pushNamed(PageId.GROUP_PERSONAL_GALLERY_PAGE);
            },
          ),
          HorizontalLine(),
          CommonTextItemView(
            leftIconAssetPath: "images/icon_file.png",
            leftTitle: "我的文件",
            callback: () {
              Navigator.of(context).pushNamed(PageId.GROUP_PERSONAL_MY_FILE_PAGE);
            },
          ),
          HorizontalLine(),
          CommonTextItemView(
            leftIconAssetPath: "images/icon_me_service.png",
            leftTitle: "联系客服",
            callback: () {
              Navigator.of(context).pushNamed(PageId.GROUP_PERSONAL_CUSTOM_SERVICE_PAGE);
            },
          ),
          HorizontalLine(height: 10,),
          CommonTextItemView(
            leftIconAssetPath: "images/icon_me_clear.png",
            leftTitle: "清理缓存",
            callback: () {
              DialogUtil.showBaseDialog(context, "", title: "清理缓存");
            },
          ),
        ],
      ),
    );
  }
}