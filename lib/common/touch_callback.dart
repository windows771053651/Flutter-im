import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// 带有按压状态的触摸控件。
/// 可自定义按下、抬起状态颜色
///
class TouchCallBack extends StatefulWidget {

  final Widget child;

  final VoidCallback callBack;

  final VoidCallback longPressCallBack;

  final Color pressedColor;

  final Color normalColor;

  final double radius;

  final double topLeftRadius;

  final double topRightRadius;

  final double bottomLeftRadius;

  final double bottomRightRadius;

  final EdgeInsetsGeometry padding;

  final EdgeInsetsGeometry margin;

  final OnTabListener onTabListener;

  TouchCallBack({
    Key key,
    @required this.child,
    this.callBack,
    this.longPressCallBack,
    this.onTabListener,
    this.pressedColor = const Color(0xffd8d8d8),
    this.normalColor = Colors.white,
    this.radius = 0,
    this.topLeftRadius = 0,
    this.topRightRadius = 0,
    this.bottomLeftRadius = 0,
    this.bottomRightRadius = 0,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
  }): super(key: key);

  @override
  State createState() => TouchState();
}

class TouchState extends State<TouchCallBack> {

  Color stateColor;

  @override
  void initState() {
    stateColor = widget.normalColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: widget.padding,
        margin: widget.margin,
        child: widget.child,
        decoration: BoxDecoration(
          borderRadius: _getBorderRadius(),
          color: stateColor,
        ),
      ),
      onTap: widget.callBack,
      onLongPress: widget.longPressCallBack,
      onTapDown: (details) {
        setState(() {
          stateColor = widget.pressedColor;
        });
      },
      onTapUp: (details) {
        setState(() {
          stateColor = widget.normalColor;
        });
        widget.onTabListener();
      },
      onTapCancel: () {
        setState(() {
          stateColor = widget.normalColor;
        });
        widget.onTabListener();
      },
      onPanDown: (d) {
        setState(() {
          stateColor = widget.pressedColor;
        });
      },
      onPanStart: (d) {
        setState(() {
          stateColor = widget.pressedColor;
        });
      },
      onPanEnd: (d) {
        setState(() {
          stateColor = widget.normalColor;
        });
        widget.onTabListener();
      },
      onPanCancel: () {
        setState(() {
          stateColor = widget.normalColor;
        });
        widget.onTabListener();
      },
    );
  }

  BorderRadius _getBorderRadius() {
    return widget.radius != 0
        ? BorderRadius.circular(widget.radius)
        : BorderRadius.only(
            topLeft: Radius.circular(widget.topLeftRadius),
            topRight: Radius.circular(widget.topRightRadius),
            bottomLeft: Radius.circular(widget.bottomLeftRadius),
            bottomRight: Radius.circular(widget.bottomRightRadius),
          );
  }
}

typedef OnTabListener = Function();