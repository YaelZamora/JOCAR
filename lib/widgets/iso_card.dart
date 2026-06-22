import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class IsoCard extends StatefulWidget {
  const IsoCard({super.key});

  @override
  State<IsoCard> createState() => _IsoCardState();
}

class _IsoCardState extends State<IsoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: colorPrimary,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: colorPrimary.withValues(alpha: _isHovered ? 0.35 : 0.2),
              blurRadius: _isHovered ? 24 : 12,
              offset: _isHovered ? const Offset(4, 8) : const Offset(4, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Certificaciones',
                  style: headlineMdStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                Text(
                  'Garantizamos la excelencia operativa bajo estándares internacionales.',
                  style: bodyMdStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.verified,
                    color: colorSecondaryContainer,
                    size: 36,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ISO 9001 - 2015',
                          style: bodyMdStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ).copyWith(fontSize: 18.0),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Sistema de Gestión de Calidad',
                          style: labelSmStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
