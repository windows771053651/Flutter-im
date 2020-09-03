import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/sub_view/chat_item.dart';
import 'package:flutter_im/common/app_bar.dart';

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

    return Scaffold(
      appBar: getAppBar(
          context,
          leftTitle: widget._name,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: widget._chatMessage.length,
                itemBuilder: (context, index) {
                  return ChatItemWidget(
                    index: index,
                    controller: (index) {
                      return widget._chatMessage[index];
                    },
                    chatMessageBean: widget._chatMessage[index],
                  );
                },
              ),
            ),
            Container(
              child: TextField(

              ),
            ),
          ],
        ),
      ),
    );
  }
}