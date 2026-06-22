import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class NavbarLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool isActive;

  const NavbarLink({
    super.key,
    required this.text,
    required this.onTap,
    this.isActive = false,
  });

  @override
  State<NavbarLink> createState() => _NavbarLinkState();
}

class _NavbarLinkState extends State<NavbarLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: widget.isActive
                    ? colorPrimary
                    : (_isHovered
                          ? colorPrimary.withValues(alpha: 0.4)
                          : Colors.transparent),
                width: 2,
              ),
            ),
          ),
          child: Text(
            widget.text,
            style: bodyMdStyle(
              color: (widget.isActive || _isHovered)
                  ? colorPrimary
                  : colorOnSurfaceVariant,
              fontWeight: widget.isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
