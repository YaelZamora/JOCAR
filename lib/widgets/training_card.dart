import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class TrainingCard extends StatefulWidget {
  const TrainingCard({super.key});

  @override
  State<TrainingCard> createState() => _TrainingCardState();
}

class _TrainingCardState extends State<TrainingCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: _isHovered
                ? colorPrimary.withValues(alpha: 0.4)
                : const Color(0x33C3C5D7),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? colorPrimary.withValues(alpha: 0.15)
                  : Colors.black.withValues(alpha: 0.04),
              blurRadius: _isHovered ? 24 : 10,
              offset: _isHovered ? const Offset(0, 10) : const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(32),
        child: Stack(
          children: [
            // Top Right School Icon Indicator
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _isHovered
                      ? colorPrimary.withValues(alpha: 0.1)
                      : colorPrimary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(Icons.school, color: colorPrimary, size: 24),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Capacitación y adiestramiento',
                  style: headlineMdStyle(color: colorPrimary),
                ),
                const SizedBox(height: 32),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final bool useHorizontalColumns =
                        constraints.maxWidth > 500;
                    if (useHorizontalColumns) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                _buildCheckItem('Seguridad e higiene'),
                                const SizedBox(height: 16),
                                _buildCheckItem('Brigadas (STPS/PC)'),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              children: [
                                _buildCheckItem('Manejo de capital humano'),
                                const SizedBox(height: 16),
                                _buildCheckItem('Habilidades técnicas'),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          _buildCheckItem('Seguridad e higiene'),
                          const SizedBox(height: 16),
                          _buildCheckItem('Brigadas (STPS/PC)'),
                          const SizedBox(height: 16),
                          _buildCheckItem('Manejo de capital humano'),
                          const SizedBox(height: 16),
                          _buildCheckItem('Habilidades técnicas'),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckItem(String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check_circle, color: colorSecondary, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: bodyMdStyle(
              color: colorOnBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
