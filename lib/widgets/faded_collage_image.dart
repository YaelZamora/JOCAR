import 'package:flutter/material.dart';

/// A helper widget that renders a local asset image with custom linear gradient masks.
/// This allows fading out specific edges (top, bottom, left, or right) of the image
/// to seamlessly blend it into the grid background.
class FadedCollageImage extends StatelessWidget {
  final String assetPath;
  final double fadeTop;
  final double fadeBottom;
  final double fadeLeft;
  final double fadeRight;
  final double opacity;

  const FadedCollageImage({
    super.key,
    required this.assetPath,
    this.fadeTop = 0.0,
    this.fadeBottom = 0.0,
    this.fadeLeft = 0.0,
    this.fadeRight = 0.0,
    this.opacity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset(
      assetPath,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );

    // Apply linear gradient masks for each edge if fading is configured (> 0.0)
    if (fadeTop > 0) {
      image = ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: const [Colors.black, Colors.black, Colors.transparent],
            stops: [0.0, 1.0 - fadeTop, 1.0],
          ).createShader(rect);
        },
        blendMode: BlendMode.dstIn,
        child: image,
      );
    }

    if (fadeBottom > 0) {
      image = ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [Colors.black, Colors.black, Colors.transparent],
            stops: [0.0, 1.0 - fadeBottom, 1.0],
          ).createShader(rect);
        },
        blendMode: BlendMode.dstIn,
        child: image,
      );
    }

    if (fadeLeft > 0) {
      image = ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: const [Colors.black, Colors.black, Colors.transparent],
            stops: [0.0, 1.0 - fadeLeft, 1.0],
          ).createShader(rect);
        },
        blendMode: BlendMode.dstIn,
        child: image,
      );
    }

    if (fadeRight > 0) {
      image = ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: const [Colors.black, Colors.black, Colors.transparent],
            stops: [0.0, 1.0 - fadeRight, 1.0],
          ).createShader(rect);
        },
        blendMode: BlendMode.dstIn,
        child: image,
      );
    }

    // Set overall opacity of the blended image pane
    return Opacity(opacity: opacity, child: image);
  }
}
