import 'package:flutter/material.dart';
import 'dart:math' as math;

class SliderPainter extends CustomPainter {
  final double value;
  final Color activeColor;
  final Color inactiveColor;
  final double strokeWidth;

  SliderPainter({
    required this.value,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.strokeWidth = 10.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Offset center = Offset(radius, radius);

    // Draw inactive arc
    final inactivePaint = Paint()
      ..strokeWidth = strokeWidth
      ..color = inactiveColor
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi,
      false,
      inactivePaint,
    );

    // Draw active arc
    final activePaint = Paint()
      ..strokeWidth = strokeWidth
      ..color = activeColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double startAngle = math.pi;
    double sweepAngle = math.pi * value;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      activePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
