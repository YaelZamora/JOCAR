import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/tecnologia_ia_software_card.dart';
import 'package:jocar_web/widgets/tecnologia_ia_mobile_card.dart';
import 'package:jocar_web/widgets/tecnologia_ia_platforms_card.dart';

class TecnologiaIaServicesSection extends StatelessWidget {
  final bool isDesktop;

  const TecnologiaIaServicesSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    const double elementGap = 24.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // --- 1. INNOVATION HIGHLIGHT BANNER ---
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          decoration: BoxDecoration(
            color: colorSecondaryContainer.withValues(alpha: 0.05),
            border: Border(
              top: BorderSide(color: colorPrimary.withValues(alpha: 0.05), width: 1),
              bottom: BorderSide(color: colorPrimary.withValues(alpha: 0.05), width: 1),
            ),
          ),
          child: Center(
            child: Text(
              '"Innovación que impulsa tu crecimiento"',
              textAlign: TextAlign.center,
              style: headlineMdStyle(color: colorPrimary).copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),

        // --- 2. BENTO GRID OF SERVICES ---
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1280),
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Software & Mobile Row / Column
                if (isDesktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 8,
                        child: TecnologiaIaSoftwareCard(isDesktop: isDesktop),
                      ),
                      const SizedBox(width: elementGap),
                      Expanded(
                        flex: 4,
                        child: TecnologiaIaMobileCard(isDesktop: isDesktop),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      TecnologiaIaSoftwareCard(isDesktop: isDesktop),
                      const SizedBox(height: elementGap),
                      TecnologiaIaMobileCard(isDesktop: isDesktop),
                    ],
                  ),
                const SizedBox(height: elementGap),
                // Platforms Section (Full width)
                TecnologiaIaPlatformsCard(isDesktop: isDesktop),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
