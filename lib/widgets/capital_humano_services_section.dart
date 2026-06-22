import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/geometric_bg_painter.dart';
import 'package:jocar_web/widgets/training_card.dart';
import 'package:jocar_web/widgets/iso_card.dart';
import 'package:jocar_web/widgets/conocer_card.dart';

class CapitalHumanoServicesSection extends StatelessWidget {
  final bool isDesktop;

  const CapitalHumanoServicesSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorBackground,
      child: CustomPaint(
        painter: const GeometricBgPainter(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1280),
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Section Title
                  Column(
                    children: [
                      Text(
                        'Ejes de Servicio Integral',
                        style: headlineLgStyle(color: colorPrimary),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Container(height: 6, width: 96, color: colorSecondary),
                    ],
                  ),
                  const SizedBox(height: 64),

                  // Bento Layout
                  if (isDesktop) ...[
                    // Row 1: Training (2/3) + ISO Cert (1/3)
                    SizedBox(
                      height: 300,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Expanded(flex: 8, child: TrainingCard()),
                          const SizedBox(width: 24),
                          const Expanded(flex: 4, child: IsoCard()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Row 2: RED CONOCER
                    const ConocerCard(isDesktopLayout: true),
                  ] else ...[
                    // Vertical Stack for Mobile
                    const TrainingCard(),
                    const SizedBox(height: 24),
                    const IsoCard(),
                    const SizedBox(height: 24),
                    const ConocerCard(isDesktopLayout: false),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
