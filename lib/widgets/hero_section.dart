import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/faded_collage_image.dart';
import 'package:jocar_web/widgets/geometric_clipper.dart';
import 'package:jocar_web/widgets/tech_grid_painter.dart';

/// The Hero section of the JOCAR website landing page.
/// It features a high-tech visual collage of background images
/// representing company operations, with the JOCAR brand logo and
/// "Sistemas Integrales" tagline positioned in the center.
class HeroSection extends StatelessWidget {
  final bool isDesktop;

  const HeroSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    // Define responsive height parameters for desktop vs mobile layout
    final double height = isDesktop ? 600.0 : 400.0;

    return Container(
      height: height,
      color: colorSurface,
      child: ClipPath(
        clipper: const GeometricClipper(),
        child: Container(
          color: colorSurface,
          child: Stack(
            children: [
              // 1. Technical Grid Background
              // Renders thin, low-opacity blue grid lines across the section
              Positioned.fill(
                child: CustomPaint(painter: const TechGridPainter()),
              ),

              // 2. Image Collage (Responsive Layout)
              Positioned.fill(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final double w = constraints.maxWidth;
                    final double h = constraints.maxHeight;

                    if (isDesktop) {
                      return Stack(
                        children: [
                          // Panel 1: Servers / Infrastructure (Leftmost column)
                          // Fades on the right side (towards logo) and top/bottom edges
                          Positioned(
                            left: 0,
                            top: h * 0.05,
                            width: w * 0.16,
                            height: h * 0.9,
                            child: const FadedCollageImage(
                              assetPath: 'assets/infraestructura.png',
                              fadeRight: 0.6,
                              fadeTop: 0.2,
                              fadeBottom: 0.2,
                              opacity: 0.8,
                            ),
                          ),

                          // Panel 2: Blueprint Schematic (Column 2 top)
                          // Fades on the left, right (towards logo), and bottom edges
                          Positioned(
                            left:
                                w * 0.16 -
                                2, // Slight 2px overlap to prevent blank rendering lines
                            top: 0,
                            width: w * 0.20,
                            height: h * 0.52,
                            child: const FadedCollageImage(
                              assetPath: 'assets/planos.png',
                              fadeLeft: 0.2,
                              fadeRight: 0.6,
                              fadeBottom: 0.4,
                              opacity: 0.7,
                            ),
                          ),

                          // Panel 3: Bottom-Left Logistics Warehouse (Column 2 bottom)
                          // Fades on the left, right (towards logo), and top edges
                          Positioned(
                            left: w * 0.15 - 2,
                            top: h * 0.5,
                            width: w * 0.20,
                            height: h * 0.5,
                            child: const FadedCollageImage(
                              assetPath: 'assets/foto.jpg',
                              fadeLeft: 0.1,
                              fadeRight: 0.9,
                              fadeTop: 0.4,
                              opacity: 0.8,
                            ),
                          ),

                          // Note: The Center region (width: w * 0.36 to w * 0.50) is left intentionally empty
                          // of background images to maintain a clean backdrop for the logo.

                          // Panel 4: Top-Middle Logistics / Docks (Column 4 top)
                          // Fades on the left (towards logo), right, and bottom edges
                          Positioned(
                            left: w * 0.50,
                            top: 0,
                            width: w * 0.20,
                            height: h * 0.45,
                            child: const FadedCollageImage(
                              assetPath: 'assets/logistica.png',
                              fadeLeft: 0.6,
                              fadeRight: 0.2,
                              fadeBottom: 0.4,
                              opacity: 0.8,
                            ),
                          ),

                          // Panel 5: Robot Automation (Column 4 bottom / middle)
                          // Fades on left (towards logo), right, top, and bottom edges
                          Positioned(
                            left: w * 0.69 - 2,
                            top: h * 0.28,
                            width: w * 0.17,
                            height: h * 0.72,
                            child: const FadedCollageImage(
                              assetPath: 'assets/automatizacion.png',
                              fadeLeft: 0.4,
                              fadeRight: 0.3,
                              fadeTop: 0.3,
                              fadeBottom: 0.1,
                              opacity: 0.85,
                            ),
                          ),

                          // Panel 6: Top-Right Logistics Facility Park (Column 5 top)
                          // Fades on the left (towards robot/logo) and bottom edges
                          Positioned(
                            left: w * 0.84 - 2,
                            top: 0,
                            width: w * 0.16 + 2,
                            height: h * 0.52,
                            child: const FadedCollageImage(
                              assetPath: 'assets/foto2.jpg',
                              fadeLeft: 0.4,
                              fadeBottom: 0.4,
                              opacity: 0.8,
                            ),
                          ),

                          // Panel 7: Meeting Room / Corporate (Column 5 bottom)
                          // Fades on the left (towards robot/logo) and top edges
                          Positioned(
                            left: w * 0.84 - 2,
                            top: h * 0.5,
                            width: w * 0.16 + 2,
                            height: h * 0.5,
                            child: const FadedCollageImage(
                              assetPath: 'assets/foto3.jpg',
                              fadeLeft: 0.4,
                              fadeTop: 0.4,
                              opacity: 0.8,
                            ),
                          ),
                        ],
                      );
                    } else {
                      // Mobile layout: simplified view with highly-faded side watermarks
                      // to prevent clutter on narrow screens while keeping the branding context.
                      return Stack(
                        children: [
                          // Highly faded servers on the left
                          Positioned(
                            left: -w * 0.1,
                            top: h * 0.1,
                            width: w * 0.4,
                            height: h * 0.8,
                            child: const FadedCollageImage(
                              assetPath: 'assets/infraestructura.png',
                              fadeRight: 0.8,
                              fadeTop: 0.3,
                              fadeBottom: 0.3,
                              opacity: 0.2,
                            ),
                          ),
                          // Highly faded automation arm on the right
                          Positioned(
                            right: -w * 0.1,
                            top: h * 0.1,
                            width: w * 0.4,
                            height: h * 0.8,
                            child: const FadedCollageImage(
                              assetPath: 'assets/automatizacion.png',
                              fadeLeft: 0.8,
                              fadeTop: 0.3,
                              fadeBottom: 0.3,
                              opacity: 0.2,
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),

              // 3. Central Radial Gradient Glow
              // Creates a subtle white/grey spotlight behind the logo to ensure high readability
              // and a premium smooth blend into the collage images.
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        colorSurface,
                        colorSurface.withValues(alpha: 0.4),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                      radius: 0.75,
                    ),
                  ),
                ),
              ),

              // 4. Center Logo and "Sistemas Integrales" Subtitle
              Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1280),
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Image.asset(
                    'assets/logo.png',
                    width: isDesktop ? 600.0 : 240.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
