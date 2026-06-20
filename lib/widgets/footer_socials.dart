import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class FooterSocials extends StatelessWidget {
  const FooterSocials({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SÍGUENOS',
          style: labelSmStyle(color: Colors.white).copyWith(letterSpacing: 1.5),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            _buildSocialIconButton(icon: Icons.share),
            const SizedBox(width: 16),
            _buildSocialIconButton(icon: Icons.link),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIconButton({required IconData icon}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}
