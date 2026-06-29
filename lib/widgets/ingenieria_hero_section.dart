import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/angle_divider_top_clipper.dart';
import 'package:jocar_web/widgets/cut_corner_button.dart';

class IngenieriaHeroSection extends StatelessWidget {
  final bool isDesktop;
  final ScrollController scrollController;

  const IngenieriaHeroSection({
    super.key,
    required this.isDesktop,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const AngleDividerTopClipper(),
      child: Container(
        color: colorPrimary,
        child: Stack(
          children: [
            // Ambient Radial Gradient behind the content
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colorPrimary,
                      colorPrimary.withValues(alpha: 0.9),
                      colorPrimary.withValues(alpha: 0.7),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1280),
                padding: EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: isDesktop ? 100.0 : 60.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: colorSecondaryContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'SERVICIOS INDUSTRIALES',
                              style: labelSmStyle(
                                color: colorOnSecondaryContainer,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Servicios de Ingeniería',
                            style: displayLgStyle(
                              color: Colors.white,
                              fontSize: isDesktop ? 56.0 : 38.0,
                            ),
                          ),
                          const SizedBox(height: 24),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: Text(
                              'Soluciones integrales de infraestructura, mantenimiento y diseño técnico para plantas industriales y entornos corporativos de alta demanda.',
                              style: bodyLgStyle(
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
                            ),
                          ),
                          const SizedBox(height: 48),
                          Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: [
                              CutCornerButton(
                                text: 'Consultar Proyecto',
                                isSecondaryContainer: true,
                                horizontalPadding: 32,
                                verticalPadding: 18,
                                onPressed: () {
                                  // Scroll to Contact Section
                                  scrollController.animateTo(
                                    scrollController.position.maxScrollExtent,
                                    duration: const Duration(milliseconds: 1000),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              ),
                              CutCornerButton(
                                text: 'Ver Portafolio',
                                isSecondaryBorder: true,
                                horizontalPadding: 32,
                                verticalPadding: 18,
                                onPressed: () {
                                  // Scroll down to Services section (starts around 500-600px height)
                                  scrollController.animateTo(
                                    isDesktop ? 550 : 650,
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
