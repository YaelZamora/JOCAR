import 'package:flutter/material.dart';

class AngleDividerBottomClipper extends CustomClipper<Path> {
  const AngleDividerBottomClipper();

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, size.height * 0.05) // Subtle entry slope at top left
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
