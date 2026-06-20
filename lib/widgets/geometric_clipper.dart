import 'package:flutter/material.dart';

class GeometricClipper extends CustomClipper<Path> {
  const GeometricClipper();

  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * 0.94) // Subtle 6% slope at bottom
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
