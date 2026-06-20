import 'package:flutter/material.dart';
import 'package:jocar_web/widgets/contact_info.dart';
import 'package:jocar_web/widgets/contact_form.dart';

class ContactSection extends StatelessWidget {
  final bool isDesktop;

  const ContactSection({
    super.key,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1280),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: isDesktop
              ? const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: ContactInfo()),
                    SizedBox(width: 80),
                    Expanded(child: ContactForm()),
                  ],
                )
              : const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ContactInfo(),
                    SizedBox(height: 56),
                    ContactForm(),
                  ],
                ),
        ),
      ),
    );
  }
}
