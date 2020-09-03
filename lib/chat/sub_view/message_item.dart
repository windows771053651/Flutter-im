import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/message_bean.dart';
import 'package:flutter_im/common/circle.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/im_tools.dart';

class MessageItem extends StatelessWidget {
  
  MessageData messageData;

  OnContextMenuSelector onContextMenuSelected;

  MessageItem(this.messageData, {this.onContextMenuSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Color(0xffededed),
          ),
        ),
      ),
      child: TouchCallBack(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(12),
              child: Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  _getAvatar(messageData.messageType),
                  Visibility(
                    visible: !messageData.read,
                    child: Circle(radius: 4),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    messageData.title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff353535),
                    ),
                    maxLines: 1,
                  ),
                  Container(
                    height: 2,
                  ),
                  Text(
                    messageData.subTitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffa9a9a9),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 12),
              padding: EdgeInsets.only(left: 4),
              child: Column(
                children: <Widget>[
                  Text(
                    formatDate(messageData.time, [HH, ":", nn, ":", ss]),
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffa9a9a9),
                    ),
                  ),
                  Container(
                    height: 6,
                  ),
                  Visibility(
                    visible: false,
                    maintainSize: true,
                    maintainState: true,
                    maintainAnimation: true,
                    child: Text(
                      formatDate(messageData.time, [HH, ":", nn, ":", ss]),
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffa9a9a9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        callBack: () {
          // 跳转聊天页面
          if (messageData.messageType == MessageType.SYSTEM) {
            Navigator.of(context).pushNamed(PageId.GROUP_CHAT_SYSTEM_MESSAGE_PAGE);
          } else if (messageData.messageType == MessageType.CHAT) {
            Navigator.of(context).pushNamed(PageId.GROUP_CHAT_CHAT_PAGE, arguments: [messageData.title, messageData.avatar]);
          } else if (messageData.messageType == MessageType.GROUP) {
            Navigator.of(context).pushNamed(PageId.GROUP_CHAT_CHAT_PAGE, arguments: [messageData.title, messageData.avatar]);
          }
        },
        longPressCallBack: () {
          Rect rect = getWidgetPosition(context);
          showMenu(
            context: context,
            color: Colors.white,
            position: RelativeRect.fromLTRB(rect.width / 2, rect.bottom - 12, rect.width / 2, 0),
            items: <PopupMenuEntry>[
              _getPopupMenuItem(context, messageData.read ? "标为未读" : "标为已读", ContextMenuEnum.READ_STATE),
              _getPopupMenuItem(context, "聊天置顶", ContextMenuEnum.MESSAGE_TOPPING),
              _getPopupMenuItem(context, "删除该聊天", ContextMenuEnum.DELETE_MESSAGE),
            ],
          );
        },
      ),
    );
  }

  Widget _getPopupMenuItem(BuildContext context, String text, ContextMenuEnum type) {
    return PopupMenuItem(
      child: TouchCallBack(
        pressedColor: Colors.transparent,
        callBack: () {
          if (onContextMenuSelected != null) {
            onContextMenuSelected(messageData, type);
          }
          Navigator.of(context).pop();
        },
        child: Text(text),
      ),
    );
  }

  Widget _getAvatar(MessageType messageType) {
    if (messageType == null) {
      return getClipRRectImage(assetPath: "images/avatar_kobe_icon.jpg", width: 40, height: 40);
    }
    if (messageType == MessageType.SYSTEM) {
      return getClipRRectImage(assetPath: "images/avatar_lufei_icon.jpg", width: 40, height: 40);
    } else if (messageType == MessageType.CHAT) {
      return getClipRRectImage(assetPath: "images/avatar_kobe_icon.jpg", width: 40, height: 40);
    } else if (messageType == MessageType.GROUP) {
      return getClipRRectImage(assetPath: "images/avatar_qiaoba_icon.jpg", width: 40, height: 40);
    }
    return getClipRRectImage(assetPath: "images/avatar_kobe_icon.jpg", width: 40, height: 40);
  }
}

typedef OnContextMenuSelector = void Function(MessageData messageData, ContextMenuEnum type);

/// ItemView点击弹出的ContextMenu三个选项对应的枚举类型
enum ContextMenuEnum {
  READ_STATE,
  MESSAGE_TOPPING,
  DELETE_MESSAGE,
}