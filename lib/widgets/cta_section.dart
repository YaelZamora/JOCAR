import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/tech_grid_painter.dart';
import 'package:jocar_web/widgets/cut_corner_button.dart';

class CTASection extends StatelessWidget {
  final bool isDesktop;
  final VoidCallback onContactTap;

  const CTASection({
    super.key,
    required this.isDesktop,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      padding: const EdgeInsets.symmetric(vertical: 96),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Tech Grid Painter (subtle watermark overlay)
          Positioned.fill(
            child: const Opacity(
              opacity: 0.1,
              child: CustomPaint(painter: TechGridPainter()),
            ),
          ),

          // Content
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Text(
                    '¿Listo para transformar el futuro de tu empresa?',
                    textAlign: TextAlign.center,
                    style: displayLgStyle(
                      color: Colors.white,
                      fontSize: isDesktop ? 44.0 : 28.0,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Únete a las empresas que ya están optimizando sus sistemas con JOCAR.',
                    textAlign: TextAlign.center,
                    style: bodyLgStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                  const SizedBox(height: 48),
                  CutCornerButton(
                    text: 'TRANSFORMA TU EMPRESA CON NOSOTROS',
                    isSecondaryContainer: true,
                    onPressed: onContactTap,
                    verticalPadding: 24,
                    horizontalPadding: 48,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
