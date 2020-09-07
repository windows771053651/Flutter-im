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

  double lastItemDividerHeight;

  ChatItemWidget({
    Key key,
    @required this.chatMessageBean,
    @required this.controller,
    @required this.index,
    this.lastItemDividerHeight = 0,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isShowTimeHeader = _isShowTimeHeader();
    return Container(
      padding: EdgeInsets.only(left: 12, top: 12, right: 12, bottom: lastItemDividerHeight),
      child: Column(
        children: <Widget>[
          Visibility(
            visible: isShowTimeHeader,
            child: Text(
              chatMessageBean.time,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: isShowTimeHeader ? 12 : 0,),
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
    Widget itemView;
    if (chatMessageBean.chatMessageType == ChatMessageType.TEXT) {
      itemView = ChatTextItem(chatMessageBean: chatMessageBean);
    } else if (chatMessageBean.chatMessageType == ChatMessageType.PICTURE) {
      itemView = ChatPictureItem(chatMessageBean: chatMessageBean);
    }

    return itemView;
  }
}

typedef ChatController = ChatMessageBean Function(int index);
