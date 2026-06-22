import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class ConocerCard extends StatefulWidget {
  final bool isDesktopLayout;

  const ConocerCard({super.key, required this.isDesktopLayout});

  @override
  State<ConocerCard> createState() => _ConocerCardState();
}

class _ConocerCardState extends State<ConocerCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Widget leftContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.account_balance, color: colorPrimary, size: 20),
            const SizedBox(width: 8),
            Text(
              'ORGANISMO CERTIFICADOR',
              style: labelSmStyle(color: colorPrimary),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text('RED CONOCER', style: headlineMdStyle(color: colorPrimary)),
        const SizedBox(height: 16),
        Text(
          'Evaluación y certificación de competencias laborales basadas en estándares nacionales.',
          style: bodyMdStyle(color: colorOnSurfaceVariant),
        ),
      ],
    );

    final Widget rightContent = GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: widget.isDesktopLayout ? 2 : 1,
      childAspectRatio: widget.isDesktopLayout ? 4.5 : 5.5,
      mainAxisSpacing: 16,
      crossAxisSpacing: 32,
      children: [
        _buildConocerStandard('EC0217.01 – Formación grupal'),
        _buildConocerStandard('EC0076 – Evaluación de competencia'),
        _buildConocerStandard('EC0301 – Diseño de cursos'),
        _buildConocerStandard('EC0603 – Comunicación digital'),
        _buildConocerStandard('EC0204 – Sesiones de Coaching'),
        _buildConocerStandard('EC0366 – Formación en línea'),
      ],
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: colorSurfaceContainerLow,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: colorPrimary.withValues(alpha: 0.1),
            width: 1,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: colorPrimary.withValues(alpha: 0.05),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
          ],
        ),
        padding: const EdgeInsets.all(32),
        child: widget.isDesktopLayout
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 4, child: leftContent),
                  const SizedBox(width: 48),
                  Expanded(flex: 8, child: rightContent),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  leftContent,
                  const SizedBox(height: 32),
                  rightContent,
                ],
              ),
      ),
    );
  }

  Widget _buildConocerStandard(String title) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(left: BorderSide(color: colorSecondary, width: 3)),
      ),
      padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: bodyMdStyle(
          color: colorOnBackground,
          fontWeight: FontWeight.bold,
        ).copyWith(fontSize: 14.0),
      ),
    );
  }
}
