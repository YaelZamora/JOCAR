import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class EnvironmentalListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const EnvironmentalListItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(4),
        border: const Border(
          left: BorderSide(color: colorTertiaryContainer, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: colorTertiaryContainer, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: bodyMdStyle(
                    color: colorTertiaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: labelSmStyle(
                    color: colorOnSurfaceVariant,
                  ).copyWith(fontWeight: FontWeight.normal, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
