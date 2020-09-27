import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/chat_message_bean.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/contacts/bean/contact_bean.dart';
import 'package:flutter_im/personal/bean/image_display_bean.dart';
import 'package:flutter_im/personal/image_display_page.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/im_tools.dart';
import 'package:lpinyin/lpinyin.dart';

class ChatPictureItem extends StatelessWidget {

  final ChatMessageBean chatMessageBean;

  ChatPictureItem({
    Key key,
    @required this.chatMessageBean,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getItemWidget(context);
  }

  Widget _getItemWidget(BuildContext context) {
    Widget itemView;
    if (chatMessageBean.chatMessageType == ChatMessageType.PICTURE) {
      if (chatMessageBean.inOutType == InOutType.IN) {
        itemView = _getInPictureItem(context);
      } else {
        itemView = _getOutPictureItem(context);
      }
    }

   return itemView;
  }

  Widget _getInPictureItem(BuildContext context) {
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: _getPictureOutWidget(context, false),
        ),
      ],
    );
  }

  Widget _getOutPictureItem(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: _getPictureOutWidget(context, true),
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

  Widget _getPictureOutWidget(BuildContext context, bool isOut) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 50,
        minHeight: 50,
        maxWidth: 150,
        maxHeight: 150,
      ),
      child: TouchCallBack(
        pressedColor: Colors.transparent,
        normalColor: Colors.transparent,
        child: _getPictureWidget(isOut),
        callBack: () {
          Navigator.of(context).pushNamed(
              PageId.GROUP_PERSONAL_MULTI_IMAGE_DISPLAY,
              arguments: ImageDisplayBean(pictures: [isStringNotEmpty(chatMessageBean.picturePath) ? chatMessageBean.picturePath : (chatMessageBean.nativePicturePath + ImageDisplayPage.nativePictureFlag)]));
        },
      ),
    );
  }

  Widget _getPictureWidget(bool isOut) {
    return isStringNotEmpty(chatMessageBean.picturePath)
            ? Image.network(chatMessageBean.picturePath, )
            : Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: isOut ? Alignment.topRight : Alignment.topLeft,
                    image: FileImage(File(chatMessageBean.nativePicturePath),),
                  ),
                ),
    );
  }
}