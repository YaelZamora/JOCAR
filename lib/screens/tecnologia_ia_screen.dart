import 'package:flutter/material.dart';
import 'package:jocar_web/widgets/widgets.dart';

class TecnologiaIaScreen extends StatefulWidget {
  const TecnologiaIaScreen({super.key});

  @override
  State<TecnologiaIaScreen> createState() => _TecnologiaIaScreenState();
}

class _TecnologiaIaScreenState extends State<TecnologiaIaScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 20 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_scrollController.offset <= 20 && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isDesktop = screenWidth >= 1024;

    return Scaffold(
      backgroundColor: colorBackground,
      endDrawer: !isDesktop
          ? const MobileDrawer(activeLink: 'Tecnología e IA')
          : null,
      body: Stack(
        children: [
          // Main Scrollable Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 80), // Offset for the fixed sticky Navbar

                // 1. HERO SECTION
                TecnologiaIaHeroSection(
                  isDesktop: isDesktop,
                  scrollController: _scrollController,
                ),

                // 2. SERVICES SECTION (Bento Grid)
                TecnologiaIaServicesSection(isDesktop: isDesktop),

                // 3. CTA & CONTACT SECTION
                TecnologiaIaContactSection(isDesktop: isDesktop),

                // 4. FOOTER SECTION
                FooterSection(isDesktop: isDesktop),
              ],
            ),
          ),

          // Sticky Floating Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              isScrolled: _isScrolled,
              isDesktop: isDesktop,
              activeLink: 'Tecnología e IA',
            ),
          ),
        ],
      ),
    );
  }
}
