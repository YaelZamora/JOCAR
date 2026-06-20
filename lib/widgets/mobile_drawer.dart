import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/screens/home_screen.dart';
import 'package:jocar_web/screens/capital_humano_screen.dart';
import 'package:jocar_web/screens/ingenieria_screen.dart';
import 'package:jocar_web/screens/tecnologia_ia_screen.dart';
import 'package:jocar_web/widgets/cut_corner_button.dart';

class MobileDrawer extends StatelessWidget {
  final String activeLink;

  const MobileDrawer({
    super.key,
    required this.activeLink,
  });

  void _navigateTo(BuildContext context, Widget screen, bool isHome) {
    Navigator.of(context).pop(); // Close drawer first
    if (isHome) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => screen),
        (route) => false,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => screen),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: colorBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: 'JOCAR ',
                  style: headlineMdStyle(
                    color: colorPrimary,
                    fontWeight: FontWeight.w800,
                  ).copyWith(letterSpacing: -1.5),
                  children: [
                    TextSpan(
                      text: '\nSistemas Integrales',
                      style: bodyMdStyle(
                        color: colorOnSurfaceVariant,
                        fontWeight: FontWeight.normal,
                      ).copyWith(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              _buildDrawerItem(
                context,
                'Inicio',
                activeLink == 'Inicio',
                () => _navigateTo(context, const HomeScreen(), true),
              ),
              _buildDrawerItem(
                context,
                'Capital Humano',
                activeLink == 'Capital Humano',
                () => _navigateTo(context, const CapitalHumanoScreen(), false),
              ),
              _buildDrawerItem(
                context,
                'Ingeniería',
                activeLink == 'Ingeniería',
                () => _navigateTo(context, const IngenieriaScreen(), false),
              ),
              _buildDrawerItem(
                context,
                'Tecnología e IA',
                activeLink == 'Tecnología e IA',
                () => _navigateTo(context, const TecnologiaIaScreen(), false),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CutCornerButton(
                  text: 'Solicitar Demo',
                  onPressed: () {}, // Hace nada de momento
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    String text,
    bool isActive,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          text,
          style: headlineMdStyle(
            color: isActive ? colorPrimary : colorOnSurfaceVariant,
            fontSize: 18,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
