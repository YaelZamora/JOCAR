import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class ValuesBentoCard extends StatelessWidget {
  const ValuesBentoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        color: colorPrimary,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(24)),
        ),
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'VALORES',
            style: headlineMdStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Container(height: 1, color: Colors.white.withValues(alpha: 0.2)),
          const SizedBox(height: 24),
          Column(
            children: [
              Row(
                children: [
                  Expanded(child: _buildValueItem('RESPETO')),
                  Expanded(child: _buildValueItem('HONESTIDAD')),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildValueItem('HUMILDAD')),
                  Expanded(child: _buildValueItem('CONSTANCIA')),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildValueItem('LEALTAD')),
                  Expanded(child: _buildValueItem('COMPROMISO')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildValueItem(String valueName) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.check_circle,
          size: 16,
          color: colorSecondaryContainer,
        ),
        const SizedBox(width: 8),
        Text(
          valueName,
          style: labelSmStyle(color: Colors.white).copyWith(fontSize: 11),
        ),
      ],
    );
  }
}
