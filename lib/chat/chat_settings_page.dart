import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat_biz/message_manager_impl.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/common/common_text_item.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/dialog_utils.dart';

class ChatSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String _chatUserName = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: getAppBar(
        context,
        leftTitle: "聊天信息",
      ),
      body: ListView(
        children: <Widget>[
          CommonTextItemView(
            leftTitle: "设置当前聊天背景",
            leftTitleWidth: 200,
            margin: EdgeInsets.only(top: 12),
            callback: () {
              Future future = Navigator.of(context).pushNamed(PageId.GROUP_CHAT_CHAT_BACKGROUND_SETTINGS_PAGE, arguments: "聊天背景");
              future.then((onValue) {
                if (onValue != null) {
                  print("ChatSettingsPage image:$onValue");
                  Navigator.of(context).pop([OperationType.SETTINGS_BACKGROUND, onValue]);
                }
              });
            },
          ),
          CommonTextItemView(
            leftTitle: "清空聊天记录",
            leftTitleWidth: 200,
            margin: EdgeInsets.only(top: 12),
            callback: () {
              DialogUtil.showBaseDialog(
                context,
                "确定删除和$_chatUserName的聊天记录吗？",
                right: "清空",
                rightClick: () {
                  Future future = MessageControllerImpl.instance.clearAllNativeMessage("${_chatUserName.hashCode}");
                  future.then((onValue) {
                    print("删除:$onValue条数据");
                    Navigator.of(context).pop([OperationType.DELETE_CHAT_MESSAGE, onValue]);
                  });
                }
              );
            },
          ),
        ],
      ),
    );
  }
}

enum OperationType {
  SETTINGS_BACKGROUND,
  DELETE_CHAT_MESSAGE,
}