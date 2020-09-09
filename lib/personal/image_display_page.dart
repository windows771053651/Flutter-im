import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';

class ImageDisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String avatarUrl = ModalRoute.of(context).settings.arguments;
    return TouchCallBack(
      pressedColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Image.network(avatarUrl),
      ),
      callBack: () {
        Navigator.of(context).pop();
      },
    );
  }
}