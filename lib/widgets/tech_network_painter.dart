import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

/// A CustomPainter that draws a network constellation mesh (nodes and lines)
/// at the bottom-center area of the canvas. This is used to add a high-tech,
/// premium aesthetic to the HeroSection background.
class TechNetworkPainter extends CustomPainter {
  const TechNetworkPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = colorPrimary.withValues(alpha: 0.12)
      ..strokeWidth = 1.0;

    final paintDot = Paint()
      ..color = colorPrimary.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    // Determine the bottom-center region coordinates
    final double cx = size.width / 2;
    // Position it slightly above the slanted bottom cut
    final double cy = size.height * 0.90;

    // Define coordinates of network points relative to the bottom center.
    // Specifying precise offsets to create a balanced network mesh.
    final List<Offset> points = [
      Offset(cx - 240, cy - 10),
      Offset(cx - 180, cy - 35),
      Offset(cx - 140, cy - 15),
      Offset(cx - 90, cy - 45),
      Offset(cx - 50, cy - 20),
      Offset(cx, cy - 35),
      Offset(cx + 40, cy - 15),
      Offset(cx + 90, cy - 45),
      Offset(cx + 150, cy - 25),
      Offset(cx + 210, cy - 40),
      Offset(cx + 260, cy - 15),

      // Secondary layered points for triangulation
      Offset(cx - 200, cy - 50),
      Offset(cx - 110, cy - 55),
      Offset(cx - 20, cy - 65),
      Offset(cx + 60, cy - 55),
      Offset(cx + 180, cy - 60),

      // Outer lower bounds
      Offset(cx - 300, cy - 5),
      Offset(cx + 310, cy - 10),
    ];

    // Connect close points to form triangles/polygons
    const double maxConnectionDistance = 95.0;
    for (int i = 0; i < points.length; i++) {
      for (int j = i + 1; j < points.length; j++) {
        final double dist = (points[i] - points[j]).distance;
        if (dist < maxConnectionDistance) {
          canvas.drawLine(points[i], points[j], paintLine);
        }
      }
    }

    // Paint connection dots
    for (final pt in points) {
      // Outer glow/dot
      canvas.drawCircle(pt, 3.5, paintDot);
      // Inner bright white core
      canvas.drawCircle(pt, 1.5, Paint()..color = Colors.white);
    }
  }

  @override
  bool shouldRepaint(covariant TechNetworkPainter oldDelegate) => false;
}
