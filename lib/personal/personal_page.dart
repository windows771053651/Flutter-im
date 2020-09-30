import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/horizontal_line.dart';
import 'package:flutter_im/common/common_text_item.dart';
import 'package:flutter_im/personal/personal_constant.dart';
import 'package:flutter_im/personal/sub_view/personal_header.dart';
import 'package:flutter_im/router/page_id.dart';

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
              Navigator.of(context).pushNamed(PageId.GROUP_PERSONAL_FRIENDS_UPDATES, arguments: [PersonalConstant.userName, "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600668783006&di=053009ea52d57f77df0a53c6630de73d&imgtype=0&src=http%3A%2F%2Fwww.xuanzjs.com%2FUpLoadFiles%2Fmarry%2F2012-3%2F2012033009582757201.jpg"]);
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