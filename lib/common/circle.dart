import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Circle extends StatelessWidget {

  double radius;

  Color color;

  Circle({
    Key key,
    @required this.radius,
    this.color = Colors.red,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CirclePainter(radius: radius, colo: color),
    );
  }
}

class _CirclePainter extends CustomPainter {

  double radius;

  static Color color;

  Paint _paint;

  _CirclePainter({
    this.radius,
    Color colo,
  }) {
    color = colo;
    _paint = Paint()
      ..color = color
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset.zero, radius, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}