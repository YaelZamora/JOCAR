import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/geometric_clipper.dart';
import 'package:jocar_web/widgets/tech_grid_painter.dart';
import 'package:jocar_web/widgets/pulse_dot.dart';
import 'package:jocar_web/widgets/cut_corner_button.dart';

class HeroSection extends StatelessWidget {
  final bool isDesktop;
  final VoidCallback onSolucionesTap;
  final VoidCallback onMisionTap;

  const HeroSection({
    super.key,
    required this.isDesktop,
    required this.onSolucionesTap,
    required this.onMisionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: isDesktop ? 160.0 : 120.0,
        bottom: isDesktop ? 120.0 : 80.0,
      ),
      color: colorSurface,
      child: ClipPath(
        clipper: const GeometricClipper(),
        child: Container(
          color: colorSurface,
          child: Stack(
            children: [
              // Grid Background
              Positioned.fill(
                child: CustomPaint(painter: const TechGridPainter()),
              ),

              // Blurred Radial Gradient Ornaments
              Positioned(
                right: -150,
                top: 20,
                child: Container(
                  width: 600,
                  height: 600,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        colorPrimary.withValues(alpha: 0.08),
                        colorPrimary.withValues(alpha: 0.03),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -100,
                bottom: 0,
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        colorSecondaryContainer.withValues(alpha: 0.12),
                        colorSecondaryContainer.withValues(alpha: 0.03),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              // Content Layout Container
              Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1280),
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Watermark Logo from Assets
                      Positioned.fill(
                        child: Transform.scale(
                          scale: 1.3,
                          child: Center(
                            child: Opacity(
                              opacity: 1,
                              child: Image.asset(
                                'assets/logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Main Hero Text and Buttons
                      /*Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          // Badge Pill
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: colorPrimary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: colorPrimary.withValues(alpha: 0.2),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                PulseDot(),
                                SizedBox(width: 8),
                                Text(
                                  'DIGITAL TRANSFORMATION HUB',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: colorPrimary,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Heading
                          Text.rich(
                            TextSpan(
                              text: 'Sistemas Integrales para la\n',
                              style: displayLgStyle(color: colorPrimary),
                              children: [
                                TextSpan(
                                  text: 'Excelencia Industrial',
                                  style: displayLgStyle(color: colorSecondary),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Paragraph
                          Container(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: Text(
                              'Desde 2010, impulsamos el desarrollo de Capital Humano e Ingeniería de alto impacto en Aguascalientes para el mundo.',
                              style: bodyLgStyle(color: colorOnSurfaceVariant),
                            ),
                          ),
                          const SizedBox(height: 40),

                          // Action Buttons
                          Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: [
                              CutCornerButton(
                                text: 'SOLUCIONES INTEGRALES',
                                icon: Icons.arrow_forward,
                                onPressed: onSolucionesTap,
                                verticalPadding: 20,
                                horizontalPadding: 32,
                              ),
                              CutCornerButton(
                                text: 'NUESTRA MISIÓN',
                                isPrimary: false,
                                isSecondaryBorder: true,
                                onPressed: onMisionTap,
                                verticalPadding: 20,
                                horizontalPadding: 32,
                              ),
                            ],
                          ),
                          const SizedBox(height: 80),
                        ],
                      ),*/
                    ],
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
