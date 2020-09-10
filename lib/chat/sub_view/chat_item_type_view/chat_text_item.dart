import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/chat_message_bean.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/contacts/bean/contact_bean.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/im_tools.dart';
import 'package:lpinyin/lpinyin.dart';

class ChatTextItem extends StatelessWidget {

  ChatMessageBean chatMessageBean;

  ChatTextItem({
    Key key,
    @required this.chatMessageBean,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getItemWidget(context);
  }

  Widget _getItemWidget(BuildContext context) {
    Widget itemView;
    if (chatMessageBean.chatMessageType == ChatMessageType.TEXT) {
      if (chatMessageBean.inOutType == InOutType.IN) {
        itemView = _getInTextItem(context);
      } else {
        itemView = _getOutTextItem(context);
      }
    }

    return itemView;
  }

  Widget _getInTextItem(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TouchCallBack(
          normalColor: Colors.transparent,
          pressedColor: Colors.transparent,
          callBack: () {
            ContactVO contact = ContactVO(
              name: chatMessageBean.name,
              avatarUrl: chatMessageBean.avatarUrl,
              serialNum: PinyinHelper.getPinyinE(chatMessageBean.name, separator: " ", defPinyin: '#', format: PinyinFormat.WITHOUT_TONE),
            );
            Navigator.of(context).pushNamed(PageId.GROUP_CONTACTS_USER_INFO, arguments: contact);
          },
          child: getClipRRectImage(
            networkUrl: chatMessageBean.avatarUrl,
            width: 34,
            height: 34,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 12),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Text(
            chatMessageBean.chatMessage,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getOutTextItem(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 12),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Text(
            chatMessageBean.chatMessage,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
        TouchCallBack(
          normalColor: Colors.transparent,
          pressedColor: Colors.transparent,
          callBack: () {
            ContactVO contact = ContactVO(
              name: chatMessageBean.name,
              avatarUrl: chatMessageBean.avatarUrl,
              serialNum: PinyinHelper.getPinyinE(chatMessageBean.name, separator: " ", defPinyin: '#', format: PinyinFormat.WITHOUT_TONE),
            );
            Navigator.of(context).pushNamed(PageId.GROUP_CONTACTS_USER_INFO, arguments: contact);
          },
          child: getClipRRectImage(
            networkUrl: chatMessageBean.avatarUrl,
            width: 34,
            height: 34,
          ),
        ),
      ],
    );
  }
}