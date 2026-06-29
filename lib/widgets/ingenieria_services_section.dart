import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/geometric_bg_painter.dart';
import 'package:jocar_web/widgets/ingenieria_service_card.dart';

class IngenieriaServicesSection extends StatelessWidget {
  final bool isDesktop;

  const IngenieriaServicesSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    // Left intro column (sticky style or top stack)
    final Widget leftColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingeniería de alta precisión para tu proyecto',
          style: headlineLgStyle(color: colorPrimary).copyWith(
            fontSize: isDesktop ? 32 : 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Nuestra división de ingeniería combina experiencia técnica con tecnología de vanguardia para asegurar la operatividad total de sus instalaciones.',
          style: bodyMdStyle(color: colorOnSurfaceVariant),
        ),
        const SizedBox(height: 32),
        // Certifications/checks list
        _buildCheckItem('Certificación de Calidad ISO'),
        const SizedBox(height: 16),
        _buildCheckItem('Soporte Técnico 24/7'),
        const SizedBox(height: 16),
        _buildCheckItem('Personal Especializado'),
      ],
    );

    return CustomPaint(
      painter: const GeometricBgPainter(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1280),
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final bool isLargeScreen = constraints.maxWidth > 950;
                final bool isTablet =
                    constraints.maxWidth > 650 && constraints.maxWidth <= 950;

                if (isLargeScreen) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sticky left column (simulated via alignment in crossAxisAlignment)
                      Expanded(flex: 4, child: leftColumn),
                      const SizedBox(width: 48),
                      // Right services grid (2 columns)
                      Expanded(
                        flex: 8,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 24,
                                mainAxisSpacing: 24,
                                mainAxisExtent:
                                    390, // Set height to avoid layout overflows
                              ),
                          itemCount: services.length,
                          itemBuilder: (context, index) {
                            final service = services[index];
                            return IngenieriaServiceCard(
                              title: service['title'],
                              icon: service['icon'],
                              items: List<String>.from(service['items']),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      leftColumn,
                      const SizedBox(height: 48),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isTablet ? 2 : 1,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 24,
                          mainAxisExtent: 380,
                        ),
                        itemCount: services.length,
                        itemBuilder: (context, index) {
                          final service = services[index];
                          return IngenieriaServiceCard(
                            title: service['title'],
                            icon: service['icon'],
                            items: List<String>.from(service['items']),
                          );
                        },
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckItem(String text) {
    return Row(
      children: [
        const Icon(Icons.check_circle, color: colorSecondary, size: 24),
        const SizedBox(width: 12),
        Text(
          text,
          style: bodyMdStyle(
            color: colorSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
