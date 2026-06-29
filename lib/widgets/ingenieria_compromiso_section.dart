import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class IngenieriaCompromisoSection extends StatefulWidget {
  final bool isDesktop;
  final ScrollController scrollController;

  const IngenieriaCompromisoSection({
    super.key,
    required this.isDesktop,
    required this.scrollController,
  });

  @override
  State<IngenieriaCompromisoSection> createState() =>
      _IngenieriaCompromisoSectionState();
}

class _IngenieriaCompromisoSectionState
    extends State<IngenieriaCompromisoSection> {
  bool _isImageHovered = false;
  bool _isLinkHovered = false;

  @override
  Widget build(BuildContext context) {
    // Left column: Image with offset border decoration on hover
    final Widget imageColumn = MouseRegion(
      onEnter: (_) => setState(() => _isImageHovered = true),
      onExit: (_) => setState(() => _isImageHovered = false),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background offset colored container
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: _isImageHovered ? 0 : -16,
            top: _isImageHovered ? 0 : 16,
            right: _isImageHovered ? 0 : 16,
            bottom: _isImageHovered ? 0 : -16,
            child: Container(
              decoration: BoxDecoration(
                color: colorPrimary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          // Main image
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: colorPrimary.withValues(alpha: 0.1)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuA8Seub8sY4bQXmfZMU1qvvE35KBfdmQjItZ-CMwIR6_wBSrOUAlMi8QTtzbZpZvwVIEw-EnZ88NURgz27FAhMLmdlQ-T8SQftG2sYEYKDP9gYotJh-ylEN38tfpLmeMlVE8NMTSDvuhgMa8R1pgdW9RkZUDSl0Eq_JuOoSmY9sMrzPRXPtXtgk_e58ON5PRRqfHGq1TTOAGznfPbG8TyipNWRfw2yy62Yge9PPQ5cPZTzGx4i_3jNFaYY4GIWlC0xc7eqwxOciFtw',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback to local asset if network is down
                  return Image.asset(
                    'assets/automatizacion.png',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );

    // Right column: Content, Stats & Link
    final Widget contentColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Compromiso con la Excelencia Industrial',
          style: headlineLgStyle(color: colorPrimary).copyWith(
            fontSize: widget.isDesktop ? 32 : 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Nuestros procesos están diseñados para minimizar el tiempo de inactividad de su empresa. Integramos diagnóstico digital con mano de obra altamente calificada.',
          style: bodyLgStyle(color: colorOnSurfaceVariant),
        ),
        const SizedBox(height: 40),
        
        // Stats row (2 columns)
        Row(
          children: [
            Expanded(
              child: _buildStatItem('15+', 'Años de Experiencia'),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: _buildStatItem('500+', 'Proyectos Exitosos'),
            ),
          ],
        ),
        const SizedBox(height: 48),

        // Text Link with hover effect
        MouseRegion(
          onEnter: (_) => setState(() => _isLinkHovered = true),
          onExit: (_) => setState(() => _isLinkHovered = false),
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              // Scroll to Contact form
              widget.scrollController.animateTo(
                widget.scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Conocer más sobre nuestros estándares',
                  style: bodyMdStyle(color: colorPrimary).copyWith(
                    fontWeight: FontWeight.bold,
                    decoration: _isLinkHovered
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  ),
                ),
                const SizedBox(width: 8),
                AnimatedSlide(
                  offset: _isLinkHovered ? const Offset(0.3, 0) : Offset.zero,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: colorPrimary,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 80.0),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1280),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: widget.isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 5, child: imageColumn),
                    const SizedBox(width: 64),
                    Expanded(flex: 6, child: contentColumn),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    imageColumn,
                    const SizedBox(height: 48),
                    contentColumn,
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String val, String desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          val,
          style: displayLgStyle(color: colorPrimary).copyWith(
            fontSize: 44,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          desc.toUpperCase(),
          style: labelSmStyle(
            color: colorOnSurfaceVariant.withValues(alpha: 0.6),
          ).copyWith(letterSpacing: 1.2),
        ),
      ],
    );
  }
}
