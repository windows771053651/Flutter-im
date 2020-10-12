import 'package:flutter/material.dart';
import 'package:flutter_im/utils/file_util.dart';

getAppBar(BuildContext context, {
  Key key,
  String leftTitle = "",
  bool leftIconVisible = true,
  VoidCallback leftCallback,
  List<Widget> actions,
  PreferredSizeWidget bottom,
}) {
  return AppBar(
    key: key,
    title: Text(
      leftTitle,
      style: TextStyle(
        fontSize: 16,
      ),
    ),
    leading: Visibility(
      visible: leftIconVisible,
      child: FlatButton(
          child: Image.asset(
            FileUtil.getImagePath("icon_arrow_left"),
            width: 20,
            height: 20,
          ),
          onPressed: _optionLetCallback(context, leftCallback),
      ),
    ),
    actions: actions,
    bottom: bottom,
  );
}

VoidCallback _optionLetCallback(BuildContext context, VoidCallback leftCallback) {
  if (leftCallback != null) {
    return leftCallback;
  } else {
    return () {
      Navigator.of(context).pop();
    };
  }
}