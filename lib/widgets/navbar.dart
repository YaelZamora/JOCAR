import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/screens/home_screen.dart';
import 'package:jocar_web/screens/capital_humano_screen.dart';
import 'package:jocar_web/screens/ingenieria_screen.dart';
import 'package:jocar_web/screens/tecnologia_ia_screen.dart';
import 'package:jocar_web/widgets/navbar_link.dart';
import 'package:jocar_web/widgets/cut_corner_button.dart';

class Navbar extends StatelessWidget {
  final bool isScrolled;
  final bool isDesktop;
  final String activeLink;

  const Navbar({
    super.key,
    required this.isScrolled,
    required this.isDesktop,
    required this.activeLink,
  });

  void _navigateTo(BuildContext context, Widget screen, bool isHome) {
    if (isHome) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => screen),
        (route) => false,
      );
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isScrolled ? 64.0 : 80.0,
          decoration: BoxDecoration(
            color: colorSurface.withValues(alpha: 0.9),
            border: Border(
              bottom: BorderSide(
                color: colorPrimary.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            boxShadow: isScrolled
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1280),
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo / Branding
                  GestureDetector(
                    onTap: () => _navigateTo(context, const HomeScreen(), true),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Image.asset("assets/logo.png", scale: 5),
                    ),
                  ),

                  // Desktop Nav Links
                  if (isDesktop)
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            NavbarLink(
                              text: 'Inicio',
                              isActive: activeLink == 'Inicio',
                              onTap: () =>
                                  _navigateTo(context, HomeScreen(), true),
                            ),
                            const SizedBox(width: 24),
                            NavbarLink(
                              text: 'Capital Humano',
                              isActive: activeLink == 'Capital Humano',
                              onTap: () => _navigateTo(
                                context,
                                CapitalHumanoScreen(),
                                false,
                              ),
                            ),
                            const SizedBox(width: 24),
                            NavbarLink(
                              text: 'Ingeniería',
                              isActive: activeLink == 'Ingeniería',
                              onTap: () => _navigateTo(
                                context,
                                IngenieriaScreen(),
                                false,
                              ),
                            ),
                            const SizedBox(width: 24),
                            NavbarLink(
                              text: 'Tecnología e IA',
                              isActive: activeLink == 'Tecnología e IA',
                              onTap: () => _navigateTo(
                                context,
                                TecnologiaIaScreen(),
                                false,
                              ),
                            ),
                            const SizedBox(width: 24),
                            CutCornerButton(
                              text: 'Solicitar Demo',
                              onPressed: () {}, // Hace nada de momento
                              verticalPadding: 12,
                              horizontalPadding: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    // Mobile Hamburger Trigger
                    IconButton(
                      icon: const Icon(Icons.menu, color: colorPrimary),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
