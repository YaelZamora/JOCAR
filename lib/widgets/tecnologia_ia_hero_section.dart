import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/angle_divider_top_clipper.dart';

class TecnologiaIaHeroSection extends StatefulWidget {
  final bool isDesktop;
  final ScrollController scrollController;

  const TecnologiaIaHeroSection({
    super.key,
    required this.isDesktop,
    required this.scrollController,
  });

  @override
  State<TecnologiaIaHeroSection> createState() => _TecnologiaIaHeroSectionState();
}

class _TecnologiaIaHeroSectionState extends State<TecnologiaIaHeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 12.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildCutButton({
    required String text,
    required VoidCallback onPressed,
    Color? bgColor,
    Color? textColor,
    BorderSide border = BorderSide.none,
    IconData? icon,
    double verticalPadding = 16,
    double horizontalPadding = 24,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? colorPrimary,
        elevation: (bgColor == Colors.transparent || bgColor == null) ? 0 : 4,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(12)),
        ),
        side: border,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: labelSmStyle(
              color: textColor ?? Colors.white,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          if (icon != null) ...[
            const SizedBox(width: 8),
            Icon(icon, size: 16, color: textColor ?? Colors.white),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const AngleDividerTopClipper(),
      child: Container(
        color: colorOnBackground,
        child: Stack(
          children: [
            // Ambient Radial Glow for High Tech feel
            Positioned(
              right: widget.isDesktop ? 100 : 0,
              top: widget.isDesktop ? 100 : 50,
              child: Container(
                width: widget.isDesktop ? 400 : 250,
                height: widget.isDesktop ? 400 : 250,
                decoration: BoxDecoration(
                  color: colorPrimary.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: colorPrimary.withValues(alpha: 0.25),
                      blurRadius: 120,
                      spreadRadius: 40,
                    ),
                  ],
                ),
              ),
            ),

            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1280),
                padding: EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: widget.isDesktop ? 100.0 : 60.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 40),
                    if (widget.isDesktop)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 6,
                            child: _buildHeroContent(),
                          ),
                          const SizedBox(width: 48),
                          Expanded(
                            flex: 5,
                            child: _buildHeroImage(),
                          ),
                        ],
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildHeroContent(),
                          const SizedBox(height: 48),
                          _buildHeroImage(),
                        ],
                      ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: colorSecondaryContainer.withValues(alpha: 0.4),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            'DIGITAL TRANSFORMATION',
            style: labelSmStyle(
              color: colorSecondaryContainer,
            ),
          ),
        ),
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(
            style: displayLgStyle(
              color: Colors.white,
              fontSize: widget.isDesktop ? 56.0 : 36.0,
            ),
            children: [
              const TextSpan(text: 'Tecnología\n'),
              TextSpan(
                text: 'e Inteligencia Artificial',
                style: TextStyle(color: colorSecondaryContainer),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            'Desarrollamos ecosistemas digitales robustos que transforman la complejidad operativa en ventajas competitivas mediante automatización y análisis predictivo.',
            style: bodyLgStyle(
              color: colorSurfaceContainerHighest.withValues(alpha: 0.8),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _buildCutButton(
              text: 'Explorar Soluciones',
              bgColor: colorPrimary,
              textColor: Colors.white,
              onPressed: () {
                // Scroll down to services
                widget.scrollController.animateTo(
                  widget.isDesktop ? 700 : 950,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                );
              },
            ),
            _buildCutButton(
              text: 'Ver Demo',
              bgColor: Colors.transparent,
              textColor: colorSecondaryContainer,
              border: const BorderSide(
                color: colorSecondaryContainer,
                width: 2,
              ),
              onPressed: () {
                // Scroll down to contact form / CTA
                widget.scrollController.animateTo(
                  widget.scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroImage() {
    final imageWidget = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorSecondaryContainer.withValues(alpha: 0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 25,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDTmGBb7THDOJKTnM1wxzfukxG00fe1qi3Rq4IXp2j18fDk2edGeYOr0lvnu3gAMqd-kB86QjcdqmlhtcIapTnzxoqlrfomebx8pvxSbNo7owOys63CoRWWkbwV7MeH60WU5OTfNPul5FK0rLgvmNp-Wi9IRXA_J3ZlpdZTxYJ7a2R1mVxQ6temcUyr98aSkn88wL5f8a-rPNCVKm8qqNrr2oB5fJ1ZldDagrhrn95Vt88z9q1g-DUFYJvYflztli5OzlqnmQmP7hw',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            height: 350,
            color: colorSurfaceContainer,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, size: 64, color: colorPrimary),
          ),
        ),
      ),
    );

    if (widget.isDesktop) {
      return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -_animation.value),
            child: child,
          );
        },
        child: imageWidget,
      );
    } else {
      return imageWidget;
    }
  }
}
