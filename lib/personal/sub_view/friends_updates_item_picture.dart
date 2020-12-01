import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/constants/constants.dart';
import 'package:flutter_im/personal/bean/friends_updates_bean.dart';
import 'package:flutter_im/personal/bean/image_display_bean.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/im_tools.dart';

class FriendsUpdatesItemPicture extends StatelessWidget {

  static const int itemPictureCount = 3;

  final FriendsUpdatesBean itemBean;

  FriendsUpdatesItemPicture(this.itemBean);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          itemBean.userName,
          style: TextStyle(
            fontSize: 14,
            color: Colors.blue[700],
            decoration: TextDecoration.none,
            fontWeight: FontWeight.normal,
          ),
        ),
        Text(
          itemBean.title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.normal,
          ),
        ),
        _getNormalItemPictures(context),
      ],
    );
  }

  Widget _getNormalItemPictures(BuildContext context) {
    if (IMUtils.isListNotEmpty(itemBean.icons)) {
      if (itemBean.icons.length == 1) {
        return Container(
          margin: EdgeInsets.only(top: 4),
          child: _getOnePictureItem(context),
        );
      } else {
        return Container(
          margin: EdgeInsets.only(top: 4),
          child: _getOneMorePictureItem(context),
        );
      }
    } else {
      return Container();
    }
  }

  Widget _getOnePictureItem(BuildContext context) {
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
        child: _getOnePictureModePicWidget(itemBean.icons[0].iconUrl),
        callBack: () {
          Navigator.of(context).pushNamed(PageId.GROUP_PERSONAL_MULTI_IMAGE_DISPLAY, arguments: ImageDisplayBean(pictures: List.generate(itemBean.icons.length, (index) => itemBean.icons[index].iconUrl)));
        },
      ),
    );
  }

  Widget _getOneMorePictureItem(BuildContext context) {
    double pictureCellWidth = (MediaQuery.of(context).size.width - 34 - 12 * 2 - 8 - 2 * 2 - 4) / 3;
    int rowCount = itemBean.icons.length ~/ itemPictureCount + (itemBean.icons.length % itemPictureCount == 0 ? 0 : 1);
    List<Widget> children = List(rowCount);
    for (int i = 0; i < rowCount; i++) {
      children[i] = _getOneMorePictureItemRow(context, i * itemPictureCount, i * itemPictureCount + itemPictureCount, pictureCellWidth);
    }
    return Column(
      children: children,
    );
  }

  Widget _getOneMorePictureItemRow(BuildContext context, int start, int end, double pictureCellWidth) {
    int index = 0;
    List<Widget> children = List(min(end - start, itemBean.icons.length - start));
    for (int i = start; i < end && i < itemBean.icons.length; i++) {
      children[index] = TouchCallBack(
        margin: EdgeInsets.only(top: 2, right: 2),
        child: _getMorePictureModePicWidget(itemBean.icons[i].iconUrl, pictureCellWidth),
        callBack: () {
          Navigator.of(context).pushNamed(
            PageId.GROUP_PERSONAL_MULTI_IMAGE_DISPLAY,
            arguments: ImageDisplayBean(index:i, pictures: List.generate(itemBean.icons.length, (index) => itemBean.icons[index].iconUrl),),
          );
        },
      );
      index++;
    }
    return Row(
      children: children,
    );
  }

  Widget _getOnePictureModePicWidget(String picturePath) {
    return !picturePath.contains(Constants.nativePictureFlag)
        ? CachedNetworkImage(
            imageUrl: picturePath,
            fit: BoxFit.cover,
          )
        : Container(
            decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topLeft,
              image: FileImage(File(picturePath.substring(0, picturePath.indexOf(Constants.nativePictureFlag))),),
              fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _getMorePictureModePicWidget(String picturePath, double pictureCellWidth) {
    return !picturePath.contains(Constants.nativePictureFlag)
        ? CachedNetworkImage(
            imageUrl: picturePath,
            width: pictureCellWidth,
            height: pictureCellWidth,
            fit: BoxFit.cover,
          )
        : Container(
            width: pictureCellWidth,
            height: pictureCellWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(File(picturePath.substring(0, picturePath.indexOf(Constants.nativePictureFlag))),),
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}