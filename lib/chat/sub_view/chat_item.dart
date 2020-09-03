import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/chat_message_bean.dart';
import 'package:flutter_im/utils/im_tools.dart';

import 'chat_item/chat_picture_item.dart';
import 'chat_item/chat_text_item.dart';

class ChatItemWidget extends StatelessWidget {

  ChatMessageBean chatMessageBean;

  ChatController controller;

  int index;

  ChatItemWidget({
    Key key,
    @required this.chatMessageBean,
    @required this.controller,
    @required this.index,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, top: 12, right: 12),
      child: Column(
        children: <Widget>[
          Visibility(
            visible: _isShowTimeHeader(),
            child: Text(
              chatMessageBean.time,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12,),
            child: _getItemWidget(),
          ),
        ],
      ),
    );
  }

  bool _isShowTimeHeader() {
    bool visible;
    if (index == 0) {
      visible = true;
    } else {
      ChatMessageBean last = controller(index - 1);
      visible = !compareString(last.time, chatMessageBean.time);
    }

    return visible;
  }

  Widget _getItemWidget() {
    if (chatMessageBean.chatMessageType == ChatMessageType.TEXT) {
      return ChatTextItem(chatMessageBean: chatMessageBean);
    } else if (chatMessageBean.chatMessageType == ChatMessageType.PICTURE) {
      return ChatPictureItem(chatMessageBean: chatMessageBean);
    }
  }
}

typedef ChatController = ChatMessageBean Function(int index);
