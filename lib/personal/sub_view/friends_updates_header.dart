import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/horizontal_line.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/utils/im_tools.dart';
import 'package:image_picker/image_picker.dart';

import '../personal_constant.dart';

class FriendsUpdatesHeader extends StatefulWidget {

  final String name;

  final String avatarUrl;

  FriendsUpdatesHeader({
    @required this.name,
    @required this.avatarUrl,
  });

  @override
  State createState() => _FriendsUpdatesHeaderState();
}

class _FriendsUpdatesHeaderState extends State<FriendsUpdatesHeader> {

  File _backgroundImageFile = File("");

  /// 是否是本地图片
  bool _isBackgroundNativeResource = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _getBackgroundWidget(),
        _getAppBarWidget(),
      ],
    );
  }

  Widget _getAppBarWidget() {
    return Row(
      children: <Widget>[
        TouchCallBack(
          normalColor: Colors.transparent,
          pressedColor: Colors.transparent,
          margin: EdgeInsets.only(top:  MediaQuery.of(context).padding.top),
          padding: EdgeInsets.all(12),
          child: Image.asset(
            "images/icon_arrow_left.png",
            width: 20,
            height: 20,
            color: Colors.white,
          ),
          callBack: () {
            Navigator.of(context).pop();
          },
        ),
        Expanded(
          child: Container(
            height: 1,
          ),
        ),
        TouchCallBack(
          normalColor: Colors.transparent,
          pressedColor: Colors.transparent,
          margin: EdgeInsets.only(top:  MediaQuery.of(context).padding.top),
          padding: EdgeInsets.all(12),
          child: Icon(Icons.photo_camera, color: Colors.white,),
          callBack: () {
            _displayHeaderBgSelectDialog();
          },
        ),
      ],
    );
  }

  Widget _getBackgroundWidget() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 12),
          child: AspectRatio(
            aspectRatio: PersonalConstant.friendsUpdatesHeaderBgRatio,
            child: _getHeaderBackgroundImageWidget(),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 12),
          child: getClipRRectImage(
            networkUrl: widget.avatarUrl,
            radius: 6,
            width: 60,
            height: 60,
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 18, right: 84),
          child: Text(
            widget.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getHeaderBackgroundImageWidget() {
    return _isBackgroundNativeResource
        ? Container(
            decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(_backgroundImageFile),
              fit: BoxFit.cover,
            ),
          ),)
        : Image.asset(PersonalConstant.friendsUpdatesHeaderBg, fit: BoxFit.cover,);
  }

  void _displayHeaderBgSelectDialog() {
    showDialog(context: context, builder: (context) {
      return SimpleDialog(
        contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                _getDialogItem(
                  text: "拍摄图片",
                  topLeftRadius: 3,
                  topRightRadius: 3,
                  callback: () {
                    _takePhoto(context);
                  }
                ),
                HorizontalLine(),
                _getDialogItem(
                  text: "从相册选择",
                  callback: () {
                    _openGallery(context);
                  }
                ),
                HorizontalLine(),
                _getDialogItem(
                  text: "取消",
                  bottomLeftRadius: 3,
                  bottomRightRadius: 3,
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  /*拍照*/
  _takePhoto(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null && image.existsSync()) {
      _backgroundImageFile = image;
      setState(() {
        _isBackgroundNativeResource = true;
      });
    }
  }

  /*相册*/
  _openGallery(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null && image.existsSync()) {
      _backgroundImageFile = image;
      setState(() {
        _isBackgroundNativeResource = true;
      });
    }
  }

  Widget _getDialogItem({
    String text,
    double topLeftRadius = 0.0,
    double topRightRadius = 0.0,
    double bottomLeftRadius = 0.0,
    double bottomRightRadius = 0.0,
    VoidCallback callback,
  }) {
    return TouchCallBack(
      child: Container(
        alignment: Alignment.center,
        child: Text(text),
        width: double.infinity,
        height: 50,
      ),
      callBack: () {
        if (callback != null) {
          callback();
        }
        Navigator.of(context).pop();
      },
      topLeftRadius: topLeftRadius,
      topRightRadius: topRightRadius,
      bottomLeftRadius: bottomLeftRadius,
      bottomRightRadius: bottomRightRadius,
    );
  }
}