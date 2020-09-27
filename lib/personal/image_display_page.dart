import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/indicator.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'bean/image_display_bean.dart';

/// 图片预览页面，可以显示网络图片和本地图片。本地图片path后面加有[nativePictureFlag]标志
class ImageDisplayPage extends StatefulWidget {
  /// 本地图片标志，用以区分网络图片
  static final String nativePictureFlag = "#FlutterImNativePicture#";

  @override
  State createState() => _State();

}

class _State extends State<ImageDisplayPage> {

  ImageDisplayBean _arguments;

  PageController _pageController;

  int _currentIndex = 0;

  bool _isFirst = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirst) {
      _isFirst = false;
      _arguments = ModalRoute.of(context).settings.arguments;
      _pageController = PageController(initialPage: _arguments.index);
      _currentIndex = _arguments.index;
    }
    if (_arguments == null || _arguments.pictures == null || _arguments.pictures.length == 0) {
      return _getEmptyContainer(context);
    } else {
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
    print(_currentIndex);
    return TouchCallBack(
      pressedColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            PageView(
              controller: _pageController,
              children: List.generate(_arguments.pictures.length, (index) {
                return _getPictureWidget(_arguments.pictures[index]);
              }),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            _getIndicator(),
          ],
        ),
      ),
      callBack: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget _getIndicator() {
    return _arguments.pictures.length == 1
        ? Container()
        : Positioned(
            bottom: 30,
            child: Indicator(
                      count: _arguments.pictures.length,
                      index: _currentIndex,
                      radius: 5,
                      selectedColor: Colors.white,
                      unSelectedColor: Colors.grey,
            ),
    );
  }

  Widget _getPictureWidget(String picturePath) {
    return !picturePath.contains(ImageDisplayPage.nativePictureFlag)
        ? CachedNetworkImage(imageUrl: picturePath,)
        : Container(
            decoration: BoxDecoration(
            image: DecorationImage(image: FileImage(File(picturePath.substring(0, picturePath.indexOf(ImageDisplayPage.nativePictureFlag),),),),
        ),
      ),
    );
  }
}