import 'package:flutter/material.dart';
import 'package:jocar_web/widgets/widgets.dart';

// --- MAIN SCREEN ---
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool _isScrolled = false;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isDesktop = screenWidth >= 1024;

    return Scaffold(
      backgroundColor: colorBackground,
      endDrawer: !isDesktop ? MobileDrawer(activeLink: '') : null,
      body: Stack(
        children: [
          // Main Scrollable Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeroSection(isDesktop: isDesktop),
                IdentitySection(isDesktop: isDesktop),
                ServicesSection(isDesktop: isDesktop),
                CTASection(isDesktop: isDesktop, onContactTap: () {}),
                ContactSection(isDesktop: isDesktop),
                FooterSection(isDesktop: isDesktop),
              ],
            ),
          ),

          // Floating Navigation Bar (sticky effect)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              isScrolled: _isScrolled,
              isDesktop: isDesktop,
              activeLink: 'Inicio',
            ),
          ),
        ],
      ),
    );
  }
}
