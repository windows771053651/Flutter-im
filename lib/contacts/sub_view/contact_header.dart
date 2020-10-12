import 'package:flutter/cupertino.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/file_util.dart';

import 'contact_item.dart';

class ContactHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ContactItem(
          titleName: "添加好友",
          imageName: FileUtil.getImagePath("icon_addfriend"),
          size: 28,
          headerSutTitleVisible: false,
          callback: () {
            Navigator.of(context).pushNamed(PageId.GROUP_CONTACTS_NEW_FRIENDS);
          },
        ),
        ContactItem(
          titleName: "公共聊天室",
          imageName: FileUtil.getImagePath("icon_group"),
          size: 28,
          headerSutTitleVisible: false,
          callback: () {

          },
        ),
      ],
    );
  }
}