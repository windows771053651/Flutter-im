import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';

/// 图片预览页面，可以显示网络图片和本地图片。本地图片path后面加有[nativePictureFlag]标志
class ImageDisplayPage extends StatelessWidget {
  /// 本地图片标志，用以区分网络图片
  static final String nativePictureFlag = "#FlutterImNativePicture#";

  @override
  Widget build(BuildContext context) {
    String picturePath = ModalRoute.of(context).settings.arguments;
    return TouchCallBack(
      pressedColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: _getPictureWidget(picturePath),
      ),
      callBack: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget _getPictureWidget(String picturePath) {
    return !picturePath.contains(nativePictureFlag)
            ? Image.network(picturePath,)
            : Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(picturePath.substring(0, picturePath.indexOf(nativePictureFlag))),),
                  ),
                ),
    );
  }
}