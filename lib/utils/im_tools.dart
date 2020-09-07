import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 获取焦点
FocusNode requestFocusNode(BuildContext context) {
  FocusNode focusNode = FocusNode();
  FocusScope.of(context).requestFocus(focusNode);
  return focusNode;
}

/// 获取Widget相对父Widget的位置关系
Rect getWidgetPosition(BuildContext context) {
  final RenderBox box = context.findRenderObject() as RenderBox;
  final Offset topLeft = box.size.topLeft(box.localToGlobal(Offset.zero));
  final Offset bottomRight = box.size.bottomRight(box.localToGlobal(Offset.zero));
  return Rect.fromLTRB(topLeft.dx, topLeft.dy, bottomRight.dx, bottomRight.dy);
}

/// 获取Widget和屏幕的相对位置关系
Offset getWidgetLocalToGlobal(BuildContext context) {
  RenderBox box = context.findRenderObject();
  return box.localToGlobal(Offset.zero);
}

/// 加载圆角头像
Widget getClipRRectImage({String assetPath, String networkUrl, double width = 56, double height = 56, double radius = 4}) {
  assert(assetPath != null || networkUrl != null);
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: assetPath != null
        ? Image.asset(assetPath, width: width, height: height, fit: BoxFit.cover,)
        : Image.network(networkUrl, width: width, height: height, fit: BoxFit.cover,),
  );
}

/// 字符串是否相等
bool compareString(String str1, String str2) {
  return Comparable.compare(str1, str2) == 0;
}

void controllerListViewScrollToBottom(ScrollController controller) {
  Timer(Duration(milliseconds: 1000), () {
    controller.jumpTo(controller.position.maxScrollExtent);
  });
}