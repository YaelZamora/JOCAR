import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class TecnologiaIaMobileCard extends StatefulWidget {
  final bool isDesktop;

  const TecnologiaIaMobileCard({super.key, required this.isDesktop});

  @override
  State<TecnologiaIaMobileCard> createState() => _TecnologiaIaMobileCardState();
}

class _TecnologiaIaMobileCardState extends State<TecnologiaIaMobileCard> {
  bool _isMobileHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isMobileHovered = true),
      onExit: (_) => setState(() => _isMobileHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: widget.isDesktop ? 450 : null, // uniform height on desktop
        decoration: BoxDecoration(
          color: colorPrimary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(32), // beveled / cut look
          ),
          boxShadow: [
            BoxShadow(
              color: colorPrimary.withValues(alpha: _isMobileHovered ? 0.3 : 0.1),
              blurRadius: _isMobileHovered ? 20 : 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.phonelink_setup,
                  size: 48,
                  color: colorSecondaryContainer,
                ),
                const SizedBox(height: 24),
                Text(
                  'Aplicaciones Móviles',
                  style: headlineLgStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                Text(
                  'Experiencias nativas y multiplataforma para iOS y Android que conectan su negocio con el usuario final.',
                  style: bodyMdStyle(color: Colors.white.withValues(alpha: 0.8)),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                _buildBadge(text: 'iOS'),
                const SizedBox(width: 12),
                _buildBadge(text: 'ANDROID'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge({required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: labelSmStyle(color: Colors.white).copyWith(
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
