import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/angle_divider_bottom_clipper.dart';
import 'package:jocar_web/widgets/environmental_list_item.dart';

class CapitalHumanoEnvironmentalSection extends StatelessWidget {
  final bool isDesktop;

  const CapitalHumanoEnvironmentalSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final Widget leftCol = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SUSTENTABILIDAD CORPORATIVA',
          style: labelSmStyle(
            color: colorTertiaryContainer,
          ).copyWith(letterSpacing: 2.0),
        ),
        const SizedBox(height: 12),
        Text(
          'Medio Ambiente & Cumplimiento',
          style: headlineLgStyle(color: colorTertiaryContainer),
        ),
        const SizedBox(height: 40),

        // 3 items list
        const EnvironmentalListItem(
          icon: Icons.window,
          title: 'Inspecciones PROFEPA & PROESPA',
          description:
              'Atención y desahogo de inspecciones federales y estatales.',
        ),
        const SizedBox(height: 24),
        const EnvironmentalListItem(
          icon: Icons.gavel,
          title: 'Cumplimiento Legal SEMARNAT',
          description: 'Diagnóstico de cumplimiento legal y normativo SSMAA.',
        ),
        const SizedBox(height: 24),
        const EnvironmentalListItem(
          icon: Icons.description,
          title: 'Gestión COA & Autorizaciones',
          description:
              'Elaboración de COA Federal/Estatal y gestión de residuos.',
        ),
      ],
    );

    final Widget rightCol = Stack(
      alignment: Alignment.center,
      children: [
        // Subtle glow behind
        Positioned.fill(
          child: Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorTertiaryContainer.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        // Environmental lab image
        Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorTertiaryContainer.withValues(alpha: 0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Image.asset('assets/foto3.jpg', fit: BoxFit.cover),
            ),
          ),
        ),
        // Logos Overlay Card at bottom
        Positioned(
          bottom: 40,
          left: 32,
          right: 32,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(4),
              border: const Border(
                top: BorderSide(color: colorTertiaryContainer, width: 4),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'PROFEPA',
                  style: labelSmStyle(
                    color: colorTertiaryContainer,
                  ).copyWith(fontWeight: FontWeight.w800),
                ),
                Text(
                  'SEMARNAT',
                  style: labelSmStyle(
                    color: colorTertiaryContainer,
                  ).copyWith(fontWeight: FontWeight.w800),
                ),
                Text(
                  'SSMAA',
                  style: labelSmStyle(
                    color: colorTertiaryContainer,
                  ).copyWith(fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return ClipPath(
      clipper: const AngleDividerBottomClipper(),
      child: Container(
        color: colorSurfaceContainerHighest,
        padding: const EdgeInsets.only(top: 96, bottom: 96),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1280),
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: leftCol),
                      const SizedBox(width: 80),
                      Expanded(child: rightCol),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [leftCol, const SizedBox(height: 64), rightCol],
                  ),
          ),
        ),
      ),
    );
  }
}
