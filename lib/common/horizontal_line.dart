import 'package:flutter/cupertino.dart';
import 'package:flutter_im/resource/colors.dart';

class HorizontalLine extends StatelessWidget {

  final Color color;

  final double marginLeft;

  final double marginTop;

  final double marginRight;

  final double marginBottom;

  final double height;

  HorizontalLine({
    Key key,
    this.color = IMColors.c_ffededed,
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