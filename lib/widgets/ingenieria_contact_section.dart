import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/geometric_bg_painter.dart';
import 'package:jocar_web/widgets/ingenieria_contact_form.dart';

class IngenieriaContactSection extends StatelessWidget {
  final bool isDesktop;

  const IngenieriaContactSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorSurfaceContainer,
      child: Stack(
        children: [
          // Absolute decorative geometric background pattern on the right (1/3 width)
          if (isDesktop)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: MediaQuery.of(context).size.width / 3,
              child: Opacity(
                opacity: 0.1,
                child: CustomPaint(
                  painter: const GeometricBgPainter(),
                ),
              ),
            ),
          
          // Main content
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1280),
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Header text
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 650),
                      child: Column(
                        children: [
                          Text(
                            '¿Listo para iniciar su proyecto?',
                            textAlign: TextAlign.center,
                            style: headlineLgStyle(color: colorPrimary).copyWith(
                              fontSize: isDesktop ? 32 : 28,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Complete el formulario y un especialista técnico se pondrá en contacto con usted en menos de 24 horas.',
                            textAlign: TextAlign.center,
                            style: bodyMdStyle(color: colorOnSurfaceVariant),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 64),
                    
                    // Contact form container
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 896),
                      child: const IngenieriaContactForm(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
