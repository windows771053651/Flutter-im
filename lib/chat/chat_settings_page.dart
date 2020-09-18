import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat_biz/message_manager_impl.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/common/common_text_item.dart';
import 'package:flutter_im/common/horizontal_line.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/router/page_id.dart';

class ChatSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String chatUserName = ModalRoute.of(context).settings.arguments;

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
              Future future = Navigator.of(context).pushNamed(PageId.GROUP_CHAT_CHAT_BACKGROUND_SETTINGS_PAGE);
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
              showDeleteNativeChatMessageDialog(context, chatUserName);
            },
          ),
        ],
      ),
    );
  }

  void showDeleteNativeChatMessageDialog(BuildContext context, String chatUserName) {
    showDialog(context: context, builder: (context) {
      return SimpleDialog(
        contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    "确定删除和$chatUserName的聊天记录吗？",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  margin: EdgeInsets.only(top: 30, bottom: 30),
                ),
                HorizontalLine(
                  height: 0.5,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(2)),
                            ),
                            child: TouchCallBack(
                              bottomLeftRadius: 2,
                              child: Center(
                                child: Text(
                                  "取消",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              callBack: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 0.5,
                          height: 46,
                          color: Color(0xffededed),
                        ),
                        Expanded(
                          child: Container(
                            height: 46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(2)),
                            ),
                            child: TouchCallBack(
                              bottomRightRadius: 2,
                              child: Center(
                                child: Text(
                                  "清空",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              callBack: () {
                                Future future = MessageControllerImpl.instance.clearAllNativeMessage("");
                                future.then((onValue) {
                                  print("删除:$onValue条数据");
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop([OperationType.DELETE_CHAT_MESSAGE, onValue]);
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}

enum OperationType {
  SETTINGS_BACKGROUND,
  DELETE_CHAT_MESSAGE,
}