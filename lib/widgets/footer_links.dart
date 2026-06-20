import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class FooterLinks extends StatelessWidget {
  final String title;
  final List<String> links;

  const FooterLinks({
    super.key,
    required this.title,
    required this.links,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: labelSmStyle(color: Colors.white).copyWith(letterSpacing: 1.5),
        ),
        const SizedBox(height: 24),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: () {},
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  link,
                  style: bodyMdStyle(color: Colors.white.withOpacity(0.8)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
