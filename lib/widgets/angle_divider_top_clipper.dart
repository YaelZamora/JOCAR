import 'package:flutter/material.dart';

class AngleDividerTopClipper extends CustomClipper<Path> {
  const AngleDividerTopClipper();

  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * 0.90) // Subtle slope at bottom right
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
