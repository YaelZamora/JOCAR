import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class IdentityCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const IdentityCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: colorSurface,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: colorPrimary.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: colorSecondary),
          const SizedBox(height: 24),
          Text(
            title,
            style: headlineMdStyle(
              color: colorPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(description, style: bodyMdStyle(color: colorOnSurfaceVariant)),
        ],
      ),
    );
  }
}
