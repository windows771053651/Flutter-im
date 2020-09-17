
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/sub_view/chat_item.dart';
import 'package:flutter_im/chat/sub_view/chat_page_bottom_widget.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/router/page_id.dart';
import 'bean/chat_message_bean.dart';
import '../chat_biz/message_manager_impl.dart';

class ChatPage extends StatefulWidget {

  static bool isFirstInit = true;

  @override
  State createState() => ChatState();
}

class ChatState extends State<ChatPage> with WidgetsBindingObserver {

  ScrollController _scrollController;

  bool _isFirst = true;

  String _name;

  String _avatarUrl;

  List<ChatMessageBean> _chatMessage = List();

  File backgroundImageFile = File("");

  @override
  void initState() {
    _scrollController = ScrollController();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (MediaQuery.of(context).viewInsets.bottom == 0) {
          // 关闭键盘
        } else {
          // 显示键盘
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        }
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    MessageControllerImpl.instance.unRegisterUpdateUIListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirst) {
      _isFirst = false;
      List<String> arguments = ModalRoute.of(context).settings.arguments;
      if (arguments != null && arguments.length == 2) {
        _name = arguments[0];
        _avatarUrl = arguments[1];
        MessageControllerImpl.instance.registerUpdateUIListener((List<ChatMessageBean> messages) {
          if (messages != null && messages.length > 0) {
            setState(() {
              _chatMessage.addAll(messages);
              _scrollToBottom();
            });
          }
        }, _name, _avatarUrl);
      }
    }
    if (ChatPage.isFirstInit) {
      ChatPage.isFirstInit = false;
      Timer(Duration(milliseconds: 1000), () {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
    }

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
              child: CupertinoScrollbar(
                child: ScrollConfiguration(
                  behavior: CusBehavior(),
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

class CusBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    if (Platform.isAndroid || Platform.isFuchsia) return child;
    return super.buildViewportChrome(context, child, axisDirection);
  }
}