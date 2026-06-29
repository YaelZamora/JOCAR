import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/corner_triangle_painter.dart';

class IngenieriaServiceCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<String> items;

  const IngenieriaServiceCard({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
  });

  @override
  State<IngenieriaServiceCard> createState() => _IngenieriaServiceCardState();
}

class _IngenieriaServiceCardState extends State<IngenieriaServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: _isHovered ? colorPrimary.withValues(alpha: 0.4) : colorPrimary.withValues(alpha: 0.1),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? colorPrimary.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.03),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Decorative Accent Triangle in Top-Right corner when hovered
            Positioned(
              top: -32,
              right: -32,
              child: AnimatedOpacity(
                opacity: _isHovered ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: CustomPaint(
                  size: const Size(40, 40),
                  painter: CornerTrianglePainter(color: colorPrimary.withValues(alpha: 0.1)),
                ),
              ),
            ),
            
            // Card Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon wrapper box
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: _isHovered ? colorPrimary.withValues(alpha: 0.08) : colorSurfaceContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    widget.icon,
                    size: 32,
                    color: colorPrimary,
                  ),
                ),
                const SizedBox(height: 24),
                // Card title
                Text(
                  widget.title,
                  style: headlineMdStyle(color: colorPrimary),
                ),
                const SizedBox(height: 16),
                // Card bullet list
                Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.items.length,
                    itemBuilder: (context, idx) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '• ',
                              style: bodyMdStyle(color: colorOnSurfaceVariant),
                            ),
                            Expanded(
                              child: Text(
                                widget.items[idx],
                                style: bodyMdStyle(color: colorOnSurfaceVariant),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
