import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';

class PopupWindow extends StatelessWidget {
  final Widget child;
  final Function onClick; //点击child事件
  final EdgeInsetsGeometry padding;

  PopupWindow({
    @required this.child,
    this.onClick,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: TouchCallBack(
        pressedColor: Colors.transparent,
        normalColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
            ),
            Padding(
              child: child,
              padding: padding,
            ),
          ],
        ),
        callBack: () {
          //点击空白处
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class PopRoute extends PopupRoute {

  final Duration _duration = Duration(milliseconds: 300);

  Widget child;

  PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}