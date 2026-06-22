import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class DivisionCard extends StatefulWidget {
  final String imageUrl;
  final IconData icon;
  final String title;
  final String description;

  const DivisionCard({
    super.key,
    required this.imageUrl,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<DivisionCard> createState() => _DivisionCardState();
}

class _DivisionCardState extends State<DivisionCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        height: 450,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: _isHovered ? colorSecondaryContainer : Colors.transparent,
            width: 2,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: colorSecondaryContainer.withValues(alpha: 0.3),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: AnimatedScale(
                  scale: _isHovered ? 1.1 : 1.0,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.image,
                          color: Colors.grey,
                          size: 48,
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Graduated Overlay Layer
              Positioned.fill(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 350),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: _isHovered
                          ? [
                              Colors.transparent,
                              colorPrimary.withValues(alpha: 0.85),
                            ]
                          : [
                              Colors.white.withValues(alpha: 0.4),
                              Colors.white.withValues(alpha: 0.9),
                            ],
                    ),
                  ),
                ),
              ),

              // Contents
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Animated Icon container
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _isHovered
                            ? Colors.white.withValues(alpha: 0.2)
                            : colorSecondaryContainer.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                        widget.icon,
                        size: 32,
                        color: _isHovered ? Colors.white : colorPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Title
                    Text(
                      widget.title,
                      style: headlineMdStyle(
                        color: _isHovered ? Colors.white : colorOnSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Description
                    Text(
                      widget.description,
                      style: bodyMdStyle(
                        color: _isHovered
                            ? Colors.white.withValues(alpha: 0.9)
                            : colorOnSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Navigation Text link
                    AnimatedSlide(
                      offset: _isHovered ? const Offset(0.05, 0) : Offset.zero,
                      duration: const Duration(milliseconds: 300),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'EXPLORAR DIVISIÓN',
                            style: labelSmStyle(
                              color: _isHovered ? Colors.white : colorPrimary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_outward,
                            size: 14,
                            color: _isHovered ? Colors.white : colorPrimary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
