import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CONECTA CON NUESTROS EXPERTOS',
          style: headlineLgStyle(color: colorPrimary),
        ),
        const SizedBox(height: 24),
        Text(
          'Estamos en Aguascalientes, el corazón industrial de México. Permítenos ayudarte a escalar tu operación.',
          style: bodyLgStyle(color: colorOnSurfaceVariant),
        ),
        const SizedBox(height: 48),

        // Info List
        _buildContactDetailItem(
          icon: Icons.location_on,
          title: 'UBICACIÓN',
          subtitle: 'Aguascalientes, México',
        ),
        const SizedBox(height: 32),
        _buildContactDetailItem(
          icon: Icons.mail,
          title: 'EMAIL',
          subtitle: 'contacto@jocar.com.mx',
        ),
      ],
    );
  }

  Widget _buildContactDetailItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: colorPrimary, size: 28),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: labelSmStyle(color: colorPrimary)),
            const SizedBox(height: 4),
            Text(subtitle, style: bodyMdStyle(color: colorOnBackground)),
          ],
        ),
      ],
    );
  }
}
