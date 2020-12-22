import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/resource/colors.dart';

/// 带有选中状态的触摸控件。
class SelectCallback extends StatelessWidget {

  final Widget child;

  final VoidCallback callBack;

  final Color selectedColor;

  final Color normalColor;

  final bool selected;

  SelectCallback({
    Key key,
    @required this.child,
    this.callBack,
    this.selectedColor = IMColors.c_ffffffff,
    this.normalColor = Colors.transparent,
    this.selected = false,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: EdgeInsets.only(left: 4, top: 4, bottom: 4),
        padding: EdgeInsets.only(left: 4, right: 4),
        child: child,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: selected ? selectedColor : normalColor,
        ),
      ),
      onTap: callBack,
    );
  }
}