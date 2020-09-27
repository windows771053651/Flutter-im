import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Indicator extends StatefulWidget {

  final int index;

  final int count;

  final double radius;

  final Color selectedColor;

  final Color unSelectedColor;

  Indicator({
    @required this.count,
    @required this.index,
    @required this.radius,
    this.selectedColor = Colors.grey,
    this.unSelectedColor = const Color(0xffcdcdcd),
  });

  @override
  State createState() => _State();
}

class _State extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _getCircle(),
      ),
    );
  }

  List<Widget> _getCircle() {
    return List.generate(widget.count, (index) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: widget.radius,
        height: widget.radius,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.index == index ? widget.selectedColor : widget.unSelectedColor,
        ),
      );
    });
  }
}