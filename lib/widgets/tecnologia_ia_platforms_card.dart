import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

const _colorOutlineVariant = Color(0xFFC3C5D7);

class TecnologiaIaPlatformsCard extends StatefulWidget {
  final bool isDesktop;

  const TecnologiaIaPlatformsCard({super.key, required this.isDesktop});

  @override
  State<TecnologiaIaPlatformsCard> createState() =>
      _TecnologiaIaPlatformsCardState();
}

class _TecnologiaIaPlatformsCardState extends State<TecnologiaIaPlatformsCard> {
  bool _isPlatformsHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isPlatformsHovered = true),
      onExit: (_) => setState(() => _isPlatformsHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: colorSurfaceContainer,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: _isPlatformsHovered
                ? colorPrimary.withValues(alpha: 0.5)
                : _colorOutlineVariant.withValues(alpha: 0.6),
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _isPlatformsHovered ? 0.05 : 0.02),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: IntrinsicHeight(
            child: widget.isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 6,
                        child: _buildPlatformsLeftContent(),
                      ),
                      Expanded(
                        flex: 6,
                        child: _buildPlatformsRightImage(),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildPlatformsRightImage(),
                      _buildPlatformsLeftContent(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlatformsLeftContent() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Diseño y Desarrollo de Plataformas',
            style: headlineLgStyle(color: colorPrimary),
          ),
          const SizedBox(height: 32),
          if (widget.isDesktop)
            Row(
              children: [
                Expanded(
                  child: _buildPlatformItem(
                    icon: Icons.hub,
                    title: 'Ecosistemas Web',
                    desc: 'Arquitecturas de alto rendimiento escalables.',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildPlatformItem(
                    icon: Icons.business,
                    title: 'Portales Corp',
                    desc: 'Plataformas transaccionales robustas.',
                  ),
                ),
              ],
            )
          else
            Column(
              children: [
                _buildPlatformItem(
                  icon: Icons.hub,
                  title: 'Ecosistemas Web',
                  desc: 'Arquitecturas de alto rendimiento escalables.',
                ),
                const SizedBox(height: 16),
                _buildPlatformItem(
                  icon: Icons.business,
                  title: 'Portales Corp',
                  desc: 'Plataformas transaccionales robustas.',
                ),
              ],
            ),
          const SizedBox(height: 32),
          Text(
            'Implementamos soluciones en la nube de última generación para garantizar la disponibilidad absoluta y la seguridad integral de su información crítica.',
            style: bodyMdStyle(color: colorOnSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformItem({
    required IconData icon,
    required String title,
    required String desc,
  }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.5),
        border: Border.all(
          color: _colorOutlineVariant.withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 32,
            color: colorPrimary,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: bodyMdStyle(color: colorOnBackground).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            desc,
            style: labelSmStyle(color: colorOnSurfaceVariant).copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformsRightImage() {
    final imageWidget = Image.network(
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAGMDUgUfK5vIQVU2zXD6EWrLU_KjRZlqDR9LcAuWZIWxOA9eYgoCb4LAKAoOSpQ56mGObSRnN6NnoZPcVMIrBblgsomxbeUvoEAzzAUrgkSgSJ166wCGu3TQ6_sxEp-pXFKZVU2s6B5dL4ZL0SfpBlCMNogtyNjyrT_0IgiK9I_bsoSZ9sSsRFzeLqAgKwrj-6RLcukfvVYYJf5TVeXATDow-G6D5TNnkQoJa0solp9Sa-Sh-0Z4OnW1OHD9b1KX0-ae8ShWhdJbE',
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        height: 250,
        color: colorSurfaceContainerHigh,
        alignment: Alignment.center,
        child: const Icon(Icons.broken_image, size: 48, color: colorPrimary),
      ),
    );

    if (widget.isDesktop) {
      return SizedBox(
        height: double.infinity,
        child: imageWidget,
      );
    } else {
      return SizedBox(
        height: 250,
        width: double.infinity,
        child: imageWidget,
      );
    }
  }
}
