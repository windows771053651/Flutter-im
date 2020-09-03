import 'package:flutter/cupertino.dart';

class HorizontalLine extends StatelessWidget {

  Color color;

  double marginLeft;

  double marginTop;

  double marginRight;

  double marginBottom;

  double height;

  HorizontalLine({
    Key key,
    this.color = const Color(0xffededed),
    this.marginLeft = 0,
    this.marginTop = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    this.height = 0.5,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: this.height,
      margin: EdgeInsets.only(left: marginLeft, top: marginTop, right: marginRight, bottom: marginBottom),
      color: this.color,
    );
  }
}