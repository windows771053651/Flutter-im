
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/sub_view/chat_item.dart';
import 'package:flutter_im/chat/sub_view/chat_page_bottom_widget.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/router/page_id.dart';

import 'bean/chat_message_bean.dart';
import '../chat_biz/message_manager.dart';
import '../chat_biz/message_manager_impl.dart';

class ChatPage extends StatefulWidget {
  @override
  State createState() => ChatState();
}

class ChatState extends State<ChatPage> {

  ScrollController _scrollController;

  bool _isFirst = true;

  String _name;

  String _avatarUrl;

  List<ChatMessageBean> _chatMessage;

  File backgroundImageFile = File("");

  @override
  void initState() {
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirst) {
      _isFirst = false;
      List<String> arguments = ModalRoute.of(context).settings.arguments;
      if (arguments != null && arguments.length == 2) {
        _name = arguments[0];
        _avatarUrl = arguments[1];
        _chatMessage = getDefaultChatMessage(_name, _avatarUrl);
        MessageControllerImpl.instance.registerUpdateUIListener((message) {
          print("更新消息：" + message.toString());
          setState(() {
            _chatMessage.add(message);
          });
        }, _name, _avatarUrl);
      }
    }
    _scrollToBottom();
    return Scaffold(
      appBar: getAppBar(
        context,
        leftTitle: _name,
        actions: [
          TouchCallBack(
            normalColor: Colors.transparent,
            pressedColor: Colors.green[700],
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Image.asset("images/menu_ellipsie_icon.png", width: 32,),
            callBack: () {
              Future future = Navigator.of(context).pushNamed(PageId.GROUP_CHAT_CHAT_SETTINGS_PAGE);
              future.then((onValue) {
                if (onValue != null) {
                  print("ChatPage image:$onValue");
                  setState(() {
                    backgroundImageFile = onValue;
                  });
                }
              });
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(backgroundImageFile),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: TouchCallBack(
                pressedColor: Colors.transparent,
                normalColor: Colors.transparent,
                child: CupertinoScrollbar(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _chatMessage.length,
                    itemBuilder: (context, index) {
                      return ChatItemWidget(
                        index: index,
                        controller: (index) {
                          return _chatMessage[index];
                        },
                        chatMessageBean: _chatMessage[index],
                        lastItemDividerHeight: (_chatMessage.length == index + 1) ? 12 : 0,
                      );
                    },
                  ),
                ),
                onTabListener: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
            ),
            ChatBottomWidget(() {
              _scrollToBottom();
            }),
          ],
        ),
      ),
    );
  }

  _scrollToBottom() {
    /// 下一帧绘制完成时弹起软键盘
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }
}