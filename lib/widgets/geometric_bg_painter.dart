import 'package:flutter/material.dart';

class GeometricBgPainter extends CustomPainter {
  const GeometricBgPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = const Color(0x07003298) // rgba(0, 50, 152, 0.035)
      ..style = PaintingStyle.fill;
    final paint2 = Paint()
      ..color = const Color(0x0700696F) // rgba(0, 105, 111, 0.035)
      ..style = PaintingStyle.fill;

    const double step = 60.0;
    for (double y = 0.0; y < size.height + step; y += step) {
      for (double x = 0.0; x < size.width + step; x += step) {
        // Top-left facing triangle
        final path1 = Path()
          ..moveTo(x, y)
          ..lineTo(x + step * 0.25, y)
          ..lineTo(x, y + step * 0.25)
          ..close();
        canvas.drawPath(path1, paint1);

        // Top-right facing triangle
        final path2 = Path()
          ..moveTo(x + step, y)
          ..lineTo(x + step, y + step * 0.25)
          ..lineTo(x + step * 0.75, y)
          ..close();
        canvas.drawPath(path2, paint2);
      }
    }
  }

  @override
  bool shouldRepaint(covariant GeometricBgPainter oldDelegate) => false;
}
