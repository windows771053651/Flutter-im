import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/message_bean.dart';
import 'package:flutter_im/common/circle.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/im_tools.dart';

class MessageItem extends StatelessWidget {
  
  final MessageData messageData;

  final OnContextMenuSelector onContextMenuSelected;

  /// kMinInteractiveDimension为系统PopupMenuItem的高度；showMenu()中垂直方向内边距为_kMenuVerticalPadding，其值为8
  final double contextMenuHeight = kMinInteractiveDimension * 3 + 2 * 8;

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
                  getClipRRectImage(networkUrl: messageData.avatar, width: 40, height: 40),
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
          if (onContextMenuSelected != null && !messageData.read) {
            onContextMenuSelected(messageData, ContextMenuEnum.READ_STATE);
          }
          if (messageData.messageType == MessageType.SYSTEM) {
            Navigator.of(context).pushNamed(PageId.GROUP_CHAT_SYSTEM_MESSAGE_PAGE);
          } else if (messageData.messageType == MessageType.CHAT) {
            Navigator.of(context).pushNamed(PageId.GROUP_CHAT_CHAT_PAGE, arguments: [messageData.title, messageData.avatar]);
          } else if (messageData.messageType == MessageType.GROUP) {
            Navigator.of(context).pushNamed(PageId.GROUP_CHAT_CHAT_PAGE, arguments: [messageData.title, messageData.avatar]);
          }
        },
        longPressCallBack: () {
          showMenu(
            context: context,
            color: Colors.white,
            position: _getContextMenuRelativeRect(context),
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

  RelativeRect _getContextMenuRelativeRect(BuildContext context) {
    Rect rect = getWidgetPosition(context);
    double screenHeight = MediaQuery.of(context).size.height;
    if (screenHeight - rect.top - rect.height < contextMenuHeight) {
      /// view下边沿到屏幕底部的距离不足以显示menu时，将menu显示在view的上边
      return RelativeRect.fromLTRB(rect.width / 2, rect.top - contextMenuHeight + 12, rect.width / 2, 0);
    } else {
      return RelativeRect.fromLTRB(rect.width / 2, rect.bottom - 12, rect.width / 2, 0);
    }
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
}

typedef OnContextMenuSelector = void Function(MessageData messageData, ContextMenuEnum type);

/// ItemView点击弹出的ContextMenu三个选项对应的枚举类型
enum ContextMenuEnum {
  READ_STATE,
  MESSAGE_TOPPING,
  DELETE_MESSAGE,
}