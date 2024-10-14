import 'dart:math';
import 'package:flutter/material.dart';

class LiquidPainter extends CustomPainter {
  final double percentage;
  final Animation<double> animation;
  final Color backgroundColor;
  final Color borderColor;
  final Color liquidColor;
  final double borderWidth;

  LiquidPainter({
    required this.percentage,
    required this.animation,
    required this.backgroundColor,
    required this.borderColor,
    required this.liquidColor,
    required this.borderWidth,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - (borderWidth);

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.drawCircle(center, radius, borderPaint);

    canvas.save();
    canvas.clipPath(Path()
      ..addOval(
          Rect.fromCircle(center: center, radius: radius - (borderWidth / 2))));

    final waveHeight = size.height * (1 - percentage / 100);
    final waveOffset = size.width * 0.03 * sin(animation.value * 2 * pi);

    final path = Path()..moveTo(0, waveHeight);
    for (double x = 0; x <= size.width; x++) {
      double y = waveHeight + waveOffset * sin((x / size.width) * 2 * pi);
      path.lineTo(x, y);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    final wavePaint = Paint()
      ..color = liquidColor
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, wavePaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
