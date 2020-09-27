import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'bean/image_display_bean.dart';

/// 图片预览页面，可以显示网络图片和本地图片。本地图片path后面加有[nativePictureFlag]标志
class ImageDisplayPage extends StatelessWidget {
  /// 本地图片标志，用以区分网络图片
  static final String nativePictureFlag = "#FlutterImNativePicture#";

  ImageDisplayBean _arguments;

  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    _arguments = ModalRoute.of(context).settings.arguments;
    if (_arguments == null || _arguments.pictures == null || _arguments.pictures.length == 0) {
      return _getEmptyContainer(context);
    } else {
      _pageController = PageController(initialPage: _arguments.index);
      return _getPictureBodyWidget(context);
    }
  }

  Widget _getEmptyContainer(BuildContext context) {
    return TouchCallBack(
      pressedColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
      ),
      callBack: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget _getPictureBodyWidget(BuildContext context) {
    return TouchCallBack(
      pressedColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: PageView(
          controller: _pageController,
          children: List.generate(_arguments.pictures.length, (index) {
            return _getPictureWidget( _arguments.pictures[index]);
          }),
        ),
      ),
      callBack: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget _getPictureWidget(String picturePath) {
    return !picturePath.contains(nativePictureFlag)
            ? CachedNetworkImage(imageUrl: picturePath,)
            : Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(picturePath.substring(0, picturePath.indexOf(nativePictureFlag))),),
                  ),
                ),
    );
  }
}