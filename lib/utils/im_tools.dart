import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 获取Widget的范围属性，均为相对屏幕起始零点坐标计算所得
Rect getWidgetPosition(BuildContext context) {
  final RenderBox box = context.findRenderObject();
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
Widget getClipRRectImage({String assetPath, String networkUrl, String nativePath, double width = 56, double height = 56, double radius = 4}) {
  assert(assetPath != null || networkUrl != null || nativePath != null);
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: _getPictureWidget(assetPath, networkUrl, nativePath, width, height),
  );
}

Widget _getPictureWidget(String assetPath, String networkUrl, String nativePath, double width, double height) {
  if (assetPath != null) {
    return Image.asset(assetPath, width: width, height: height, fit: BoxFit.cover,);
  } else if (networkUrl != null) {
    return CachedNetworkImage(imageUrl: networkUrl, width: width, height: height,fit: BoxFit.cover,);
  } else if (nativePath != null) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(File(nativePath)),
          fit: BoxFit.cover,
        ),
      ),
    );
  } else {
    return Container();
  }
}

/// 字符串是否相等
bool compareString(String str1, String str2) {
  return Comparable.compare(str1, str2) == 0;
}

/// 字符串是否为空
bool isStringEmpty(String str) {
  return str == null || str.length == 0;
}

/// 字符串是否非空
bool isStringNotEmpty(String str) {
  return !isStringEmpty(str);
}

bool isListEmpty(List data) {
  return isListNotEmpty(data);
}

bool isListNotEmpty(List data) {
  return data != null && data.length > 0;
}