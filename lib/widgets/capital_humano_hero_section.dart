import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/angle_divider_top_clipper.dart';

class CapitalHumanoHeroSection extends StatelessWidget {
  final bool isDesktop;
  final ScrollController scrollController;

  const CapitalHumanoHeroSection({
    super.key,
    required this.isDesktop,
    required this.scrollController,
  });

  Widget _buildCutButton({
    required String text,
    required VoidCallback onPressed,
    Color? bgColor,
    Color? textColor,
    BorderSide border = BorderSide.none,
    IconData? icon,
    double verticalPadding = 16,
    double horizontalPadding = 24,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? colorPrimary,
        elevation: (bgColor == Colors.transparent || bgColor == null) ? 0 : 4,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(12)),
        ),
        side: border,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: labelSmStyle(
              color: textColor ?? Colors.white,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          if (icon != null) ...[
            const SizedBox(width: 8),
            Icon(icon, size: 16, color: textColor ?? Colors.white),
          ],
        ],
      ),
    );
  }

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
                      colorPrimary.withValues(alpha: 0.85),
                      colorPrimary.withValues(alpha: 0.4),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 80.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text Column
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              'TRANSFORMACIÓN ORGANIZACIONAL',
                              style: labelSmStyle(
                                color: colorOnSecondaryContainer,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Desarrollo de Capital Humano',
                            style: displayLgStyle(
                              color: Colors.white,
                              fontSize: isDesktop ? 56.0 : 36.0,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Impulsamos el potencial de su organización a través de programas integrales de capacitación, certificación y cumplimiento normativo. Transformamos el talento en resultados estratégicos.',
                            style: bodyLgStyle(
                              color: Colors.white.withValues(alpha: 0.85),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: [
                              _buildCutButton(
                                text: 'Optimiza tu equipo humano',
                                bgColor: Colors.white,
                                textColor: colorPrimary,
                                onPressed: () {
                                  scrollController.animateTo(
                                    scrollController.position.maxScrollExtent -
                                        600,
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              ),
                              _buildCutButton(
                                text: 'Ver Certificaciones',
                                bgColor: Colors.transparent,
                                textColor: colorSecondaryContainer,
                                border: const BorderSide(
                                  color: colorSecondaryContainer,
                                  width: 2,
                                ),
                                onPressed: () {
                                  scrollController.animateTo(
                                    600,
                                    duration: const Duration(milliseconds: 600),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (isDesktop) ...[
                      const SizedBox(width: 48),
                      // Image Block (Desktop only)
                      Expanded(
                        flex: 5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.3),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.1),
                                width: 1,
                              ),
                            ),
                            child: Image.asset(
                              'assets/desarrollo_capital_humano.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
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
