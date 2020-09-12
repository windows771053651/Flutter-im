import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/common/common_text_item.dart';
import 'package:flutter_im/router/page_id.dart';

class ChatSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context,
        leftTitle: "聊天信息",
      ),
      body: CommonTextItemView(
        leftTitle: "设置当前聊天背景",
        leftTitleWidth: 200,
        callback: () {
          Future future = Navigator.of(context).pushNamed(PageId.GROUP_CHAT_CHAT_BACKGROUND_SETTINGS_PAGE);
          future.then((onValue) {
            if (onValue != null) {
              print("ChatSettingsPage image:$onValue");

              Navigator.of(context).pop(onValue);
            }
          });
        },
      ),
    );
  }
}