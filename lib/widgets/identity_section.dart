import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/identity_card.dart';
import 'package:jocar_web/widgets/values_bento_card.dart';

class IdentitySection extends StatelessWidget {
  final bool isDesktop;

  const IdentitySection({
    super.key,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1280),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              // Header title
              Text(
                'NUESTRA IDENTIDAD',
                style: headlineLgStyle(
                  color: colorPrimary,
                ).copyWith(letterSpacing: -0.5),
              ),
              const SizedBox(height: 12),
              Container(width: 80, height: 4, color: colorSecondaryContainer),
              const SizedBox(height: 64),

              // Cards Layout
              isDesktop
                  ? const IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: IdentityCard(
                              icon: Icons.rocket_launch,
                              title: 'MISIÓN',
                              description:
                                  'Proporcionamos soluciones de ingeniería en mantenimiento, instalación e innovación de maquinaria, así como asesoría en gestión de capital humano.',
                            ),
                          ),
                          SizedBox(width: 32),
                          Expanded(
                            child: IdentityCard(
                              icon: Icons.visibility,
                              title: 'VISIÓN',
                              description:
                                  'Ser un referente nacional en el desarrollo de habilidades personales y proyectos de innovación industrial a través de un equipo altamente capacitado.',
                            ),
                          ),
                          SizedBox(width: 32),
                          Expanded(child: ValuesBentoCard()),
                        ],
                      ),
                    )
                  : const Column(
                      children: [
                        IdentityCard(
                          icon: Icons.rocket_launch,
                          title: 'MISIÓN',
                          description:
                              'Proporcionamos soluciones de ingeniería en mantenimiento, instalación e innovación de maquinaria, así como asesoría en gestión de capital humano.',
                        ),
                        SizedBox(height: 32),
                        IdentityCard(
                          icon: Icons.visibility,
                          title: 'VISIÓN',
                          description:
                              'Ser un referente nacional en el desarrollo de habilidades personales y proyectos de innovación industrial a través de un equipo altamente capacitado.',
                        ),
                        SizedBox(height: 32),
                        ValuesBentoCard(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
