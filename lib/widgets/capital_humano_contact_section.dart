import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/capital_humano_contact_form.dart';

class CapitalHumanoContactSection extends StatelessWidget {
  final bool isDesktop;

  const CapitalHumanoContactSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final Widget leftCard = Container(
      decoration: BoxDecoration(
        color: colorPrimary,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: colorPrimary.withValues(alpha: 0.2),
            blurRadius: 15,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Optimiza tu equipo humano',
            style: headlineMdStyle(color: Colors.white),
          ),
          const SizedBox(height: 24),
          Text(
            '¿Listo para llevar su capital humano al siguiente nivel de eficiencia y cumplimiento? Contáctenos hoy para una asesoría personalizada.',
            style: bodyMdStyle(color: Colors.white.withValues(alpha: 0.8)),
          ),
          const SizedBox(height: 48),

          // Contact points
          Row(
            children: [
              const Icon(Icons.call, color: colorSecondaryContainer, size: 24),
              const SizedBox(width: 16),
              Text(
                '+52 449 123 4567',
                style: bodyMdStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Icon(Icons.mail, color: colorSecondaryContainer, size: 24),
              const SizedBox(width: 16),
              Text(
                'contacto@jocar.com.mx',
                style: bodyMdStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Container(
      color: colorBackground,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1280),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 4, child: leftCard),
                    const SizedBox(width: 32),
                    Expanded(flex: 8, child: const CapitalHumanoContactForm()),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    leftCard,
                    const SizedBox(height: 32),
                    const CapitalHumanoContactForm(),
                  ],
                ),
        ),
      ),
    );
  }
}
