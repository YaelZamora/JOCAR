import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class CutCornerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool isSecondaryBorder;
  final bool isSecondaryContainer;
  final IconData? icon;
  final double? verticalPadding;
  final double? horizontalPadding;

  const CutCornerButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.isSecondaryBorder = false,
    this.isSecondaryContainer = false,
    this.icon,
    this.verticalPadding,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor = colorPrimary;
    Color textColor = Colors.white;
    BorderSide border = BorderSide.none;

    if (isSecondaryBorder) {
      bgColor = Colors.transparent;
      textColor = colorSecondary;
      border = const BorderSide(color: colorSecondary, width: 2);
    } else if (isSecondaryContainer) {
      bgColor = colorSecondaryContainer;
      textColor = colorOnSecondaryContainer;
    }

    final Widget label = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: labelSmStyle(color: textColor)),
        if (icon != null) ...[
          const SizedBox(width: 8),
          Icon(icon, size: 16, color: textColor),
        ],
      ],
    );

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        elevation: (isSecondaryBorder || isSecondaryContainer) ? 0 : 4,
        shadowColor: isSecondaryBorder
            ? Colors.transparent
            : colorPrimary.withOpacity(0.2),
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 16,
          horizontal: horizontalPadding ?? 24,
        ),
        shape: BeveledRectangleBorder(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(12),
          ),
          side: border,
        ),
      ),
      onPressed: onPressed,
      child: label,
    );
  }
}
