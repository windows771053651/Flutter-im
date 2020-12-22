import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/personal/bean/gallery_bean.dart';
import 'package:flutter_im/personal/bean/image_display_bean.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/im_tools.dart';

class GalleryItem extends StatelessWidget {

  static const int itemPictureCount = 3;

  final GalleryBean data;

  final GalleryController controller;

  final int index;

  GalleryItem({
    this.index,
    this.data,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _getYearWidget(),
        Container(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _getMonthWidget(),
            _getGalleryWidget(context),
          ],
        ),
      ],
    );
  }

  bool _isYearItemVisible() {
    if (index == 0) {
      return true;
    } else {
      GalleryBean last = controller(index - 1);
      if (IMUtils.compareString(last.year, data.year)) {
        return false;
      } else {
        return true;
      }
    }
  }

  Widget _getYearWidget() {
    if (_isYearItemVisible()) {
      return Container(
        margin: EdgeInsets.only(top: 32),
        child: Text(
          data.year,
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getMonthWidget() {
    return Container(
      width: 50,
      child: Text(
        data.month,
        style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _getGalleryWidget(BuildContext context) {
    double pictureCellWidth = (MediaQuery.of(context).size.width - 24 * 2 - 16 - 50 - 4 * 3) / 3;
    int rowCount = data.gallery.length ~/ itemPictureCount + (data.gallery.length % itemPictureCount == 0 ? 0 : 1);
    List<Widget> children = List(rowCount);
    for (int i = 0; i < rowCount; i++) {
      children[i] = _getOneMorePictureItemRow(context, i * itemPictureCount, i * itemPictureCount + itemPictureCount, pictureCellWidth);
    }
    return Container(
      margin: EdgeInsets.only(left: 16, top: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _getOneMorePictureItemRow(BuildContext context, int start, int end, double pictureCellWidth) {
    int index = 0;
    List<Widget> children = List(min(end - start, data.gallery.length - start));
    for (int i = start; i < end && i < data.gallery.length; i++) {
      GallerySubBean gallerySubBean = data.gallery[i];
      children[index] = TouchCallBack(
        margin: EdgeInsets.only(top: 4, right: 4),
        child: _getMorePictureModePicWidget(gallerySubBean.thumb, pictureCellWidth),
        callBack: () {
          if (gallerySubBean.isVideo) {
            Navigator.of(context).pushNamed(PageId.GROUP_PERSONAL_AUDIO_PLAYING_PAGE, arguments: [gallerySubBean.videoTitle, gallerySubBean.videoUrl]);
          } else {
            Navigator.of(context).pushNamed(
              PageId.GROUP_PERSONAL_MULTI_IMAGE_DISPLAY,
              arguments: ImageDisplayBean(
                index:i,
                pictures: data.gallery.map((galleryBean) {
                  return galleryBean.thumb;
                }).toList(),
              ),
            );
          }
        },
      );
      index++;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: children,
    );
  }

  Widget _getMorePictureModePicWidget(String picturePath, double pictureCellWidth) {
    return CachedNetworkImage(
      imageUrl: picturePath,
      width: pictureCellWidth,
      height: pictureCellWidth,
      fit: BoxFit.cover,
    );
  }
}

typedef GalleryController = GalleryBean Function(int lastIndex);
