import 'package:flutter/cupertino.dart';

class ToolsBoxItemBean {
  IconData iconData;
  String label;
  double cellSize;

  VoidCallback callback;

  ToolsBoxItemBean(this.iconData, this.label, this.cellSize, this.callback);
}
