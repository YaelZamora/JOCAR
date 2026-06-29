import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

const _colorOutlineVariant = Color(0xFFC3C5D7);

class TecnologiaIaSoftwareCard extends StatefulWidget {
  final bool isDesktop;

  const TecnologiaIaSoftwareCard({super.key, required this.isDesktop});

  @override
  State<TecnologiaIaSoftwareCard> createState() =>
      _TecnologiaIaSoftwareCardState();
}

class _TecnologiaIaSoftwareCardState extends State<TecnologiaIaSoftwareCard> {
  bool _isSoftwareHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isSoftwareHovered = true),
      onExit: (_) => setState(() => _isSoftwareHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: _isSoftwareHovered
                ? colorPrimary
                : _colorOutlineVariant.withValues(alpha: 0.6),
            width: _isSoftwareHovered ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _isSoftwareHovered ? 0.08 : 0.03),
              blurRadius: _isSoftwareHovered ? 20 : 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.isDesktop)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: _buildSoftwareContent(),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    flex: 5,
                    child: _buildSoftwareImage(),
                  ),
                ],
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildSoftwareContent(),
                  const SizedBox(height: 32),
                  _buildSoftwareImage(),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSoftwareContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.developer_mode,
          size: 48,
          color: colorPrimary,
        ),
        const SizedBox(height: 24),
        Text(
          'Desarrollo de Software',
          style: headlineLgStyle(color: colorOnBackground),
        ),
        const SizedBox(height: 24),
        _buildBulletPoint(
          boldPrefix: 'Sistemas ERP y CRM ',
          suffix: 'personalizados para control total operativo.',
        ),
        const SizedBox(height: 16),
        _buildBulletPoint(
          boldPrefix: 'Herramientas a medida ',
          suffix: 'para optimización de inventarios y logística.',
        ),
        const SizedBox(height: 16),
        _buildBulletPoint(
          boldPrefix: 'Centralización de flujos ',
          suffix: 'de trabajo internos automatizados.',
        ),
      ],
    );
  }

  Widget _buildBulletPoint({required String boldPrefix, required String suffix}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.check_circle,
          color: colorSecondary,
          size: 20,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: bodyMdStyle(color: colorOnBackground),
              children: [
                TextSpan(
                  text: boldPrefix,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: suffix),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSoftwareImage() {
    return AnimatedScale(
      scale: _isSoftwareHovered ? 1.03 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuA5HFUgeH_wdA4v3L9Vxtk8m2F83TwyTRx0fHSaOmfXvoPKjUmptgg0unEhv8kSJO6UOs_N4d_lHK86cwyQGPDHbBx0VgdfaNFwlo6TtedMvZ0LObg22_rkSKGUfO4muuH81Jdhz-s8AvFecZXaRtzsP5OOkoA-W1nacMNIEQXfbK-BNbOyePed0gXjnp6PpaO6q5kvY2nRQ1OzcjxQm0JembXNKGt_0PuSpRearsA_dSIgZMvrGW_VxJWyA3O0lIQcoecaN2zihIk',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 200,
              color: colorSurfaceContainer,
              alignment: Alignment.center,
              child: const Icon(Icons.broken_image, size: 48, color: colorPrimary),
            ),
          ),
        ),
      ),
    );
  }
}
