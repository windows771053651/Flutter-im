import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Circle extends StatelessWidget {

  double radius;

  Color color;

  Circle({
    Key key,
    @required this.radius,
    color = Colors.red,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(radius),
    );
  }
}

class CirclePainter extends CustomPainter {

  double radius;

  CirclePainter(this.radius);

  Paint _paint = Paint()
    ..color = Colors.red
    ..isAntiAlias = true
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset.zero, radius, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}