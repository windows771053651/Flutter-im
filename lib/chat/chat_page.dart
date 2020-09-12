
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/sub_view/chat_item.dart';
import 'package:flutter_im/chat/sub_view/chat_page_bottom_widget.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/utils/im_tools.dart';

import 'bean/chat_message_bean.dart';
import '../chat_biz/message_manager.dart';
import '../chat_biz/message_manager_impl.dart';

class ChatPage extends StatefulWidget {
  @override
  State createState() => ChatState();
}

class ChatState extends State<ChatPage> {

  ScrollController _controller;

  bool _isFirst = true;

  String _name;

  String _avatarUrl;

  List<ChatMessageBean> _chatMessage;

  MessageManager _messageManager;

  @override
  void initState() {
    _controller = ScrollController();
    _messageManager = MessageControllerImpl.instance;
    _messageManager.registerUpdateUIListener((message) {
      print("更新消息：" + message.toString());
      setState(() {
        _chatMessage.add(message);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
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
        _chatMessage = getDefaultChatMessage(_name, _avatarUrl);
      }
    }

    controllerListViewScrollToBottom(_controller);
    return Scaffold(
      appBar: getAppBar(
        context,
        leftTitle: _name,
        actions: [
          TouchCallBack(
            normalColor: Colors.transparent,
            pressedColor: Colors.green[700],
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Icon(Icons.menu),
            callBack: () {

            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              controller: _controller,
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
          ChatBottomWidget(_messageManager),
        ],
      ),
    );
  }
}