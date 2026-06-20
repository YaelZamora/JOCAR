import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class TechGridPainter extends CustomPainter {
  const TechGridPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colorPrimary.withValues(alpha: 0.05)
      ..strokeWidth = 1.0;

    const double gridSize = 40.0;
    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant TechGridPainter oldDelegate) => false;
}
