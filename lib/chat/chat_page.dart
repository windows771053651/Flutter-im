import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/sub_view/chat_item.dart';
import 'package:flutter_im/chat/sub_view/chat_page_bottom_widget.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/utils/im_tools.dart';

import 'bean/chat_message_bean.dart';

class ChatPage extends StatefulWidget {

  bool _isFirst = true;

  String _name;

  String _avatarUrl;

  List<ChatMessageBean> _chatMessage;

  @override
  State createState() => ChatState();
}

class ChatState extends State<ChatPage> {

  ScrollController _controller;


  @override
  void initState() {
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget._isFirst) {
      widget._isFirst = false;
      List<String> arguments = ModalRoute.of(context).settings.arguments;
      if (arguments != null && arguments.length == 2) {
        widget._name = arguments[0];
        widget._avatarUrl = arguments[1];
        widget._chatMessage = getDefaultChatMessage(widget._name, widget._avatarUrl);
      }
    }

    controllerListViewScrollToBottom(_controller);
    return Scaffold(
      appBar: getAppBar(
          context,
          leftTitle: widget._name,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: widget._chatMessage.length,
              itemBuilder: (context, index) {
                return ChatItemWidget(
                  index: index,
                  controller: (index) {
                    return widget._chatMessage[index];
                  },
                  chatMessageBean: widget._chatMessage[index],
                  lastItemDividerHeight: (widget._chatMessage.length == index + 1) ? 12 : 0,
                );
              },
            ),
          ),
          ChatBottomWidget(),
        ],
      ),
    );
  }
}