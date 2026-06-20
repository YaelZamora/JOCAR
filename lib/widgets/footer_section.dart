import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/footer_links.dart';
import 'package:jocar_web/widgets/footer_socials.dart';

class FooterSection extends StatelessWidget {
  final bool isDesktop;

  const FooterSection({
    super.key,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 1280),
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 80,
            ),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'JOCAR',
                              style: displayLgStyle(
                                color: Colors.white,
                                fontSize: 32,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Pasión por la excelencia en sistemas integrales desde 2010.',
                              style: bodyMdStyle(
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 48),
                      const Expanded(
                        child: FooterLinks(
                          title: 'DIVISIONES',
                          links: [
                            'Capital Humano',
                            'Ingeniería Industrial',
                            'Tecnología e IA',
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      const Expanded(
                        child: FooterLinks(
                          title: 'EMPRESA',
                          links: [
                            'Privacidad',
                            'Términos de Servicio',
                            'Soporte Técnico',
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      const Expanded(child: FooterSocials()),
                    ],
                  )
                : Column(
                    children: [
                      Text(
                        'JOCAR',
                        style: displayLgStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Pasión por la excelencia en sistemas integrales desde 2010.',
                        style: bodyMdStyle(
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 48),
                      const FooterLinks(
                        title: 'DIVISIONES',
                        links: [
                          'Capital Humano',
                          'Ingeniería Industrial',
                          'Tecnología e IA',
                        ],
                      ),
                      const SizedBox(height: 32),
                      const FooterLinks(
                        title: 'EMPRESA',
                        links: [
                          'Privacidad',
                          'Términos de Servicio',
                          'Soporte Técnico',
                        ],
                      ),
                      const SizedBox(height: 32),
                      const FooterSocials(),
                    ],
                  ),
          ),

          // Divider
          Container(height: 1, color: Colors.white.withOpacity(0.1)),

          // Sub-Footer copyright
          Container(
            constraints: const BoxConstraints(maxWidth: 1280),
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 32.0,
            ),
            child: isDesktop
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '© 2024 JOCAR Sistemas Integrales. Todos los derechos reservados.',
                          style: labelSmStyle(
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.public,
                            color: Colors.white.withOpacity(0.6),
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Aguascalientes, MX',
                            style: labelSmStyle(
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Text(
                        '© 2024 JOCAR Sistemas Integrales. Todos los derechos reservados.',
                        textAlign: TextAlign.center,
                        style: labelSmStyle(
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.public,
                            color: Colors.white.withOpacity(0.6),
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Aguascalientes, MX',
                            style: labelSmStyle(
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
