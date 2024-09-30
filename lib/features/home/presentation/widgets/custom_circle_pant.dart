import 'dart:math' as math;

import 'package:flutter/material.dart';

double deg2rad(double deg) => deg * math.pi / 180;

class CustomCircularPaint extends CustomPainter {
  /// ring/border thickness, default  it will be 8px [borderThickness].
  final double borderThickness;
  final double progressValue;
  final Color gradientColor;

  CustomCircularPaint({
    required this.gradientColor,
    this.borderThickness = 6.0,
    required this.progressValue,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.width / 2);

    final rect =
        Rect.fromCenter(center: center, width: size.width, height: size.width);

    Paint paint = Paint()
      ..color = Colors.white.withOpacity(.3)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = borderThickness;

    //grey background
    canvas.drawArc(
      rect,
      deg2rad(0),
      deg2rad(360),
      false,
      paint,
    );

    Paint progressBarPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = borderThickness
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          gradientColor,
          gradientColor,
          // gradientColor ?? Colors.purple,
          // gradientColor ?? Colors.orange,
          // gradientColor ?? Colors.green,
          // gradientColor ?? Colors.deepOrange,
        ],
      ).createShader(rect);
    canvas.drawArc(
      rect,
      deg2rad(-90),
      deg2rad(360 * progressValue),
      false,
      progressBarPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
