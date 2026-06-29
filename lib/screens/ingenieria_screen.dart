import 'package:flutter/material.dart';
import 'package:jocar_web/widgets/widgets.dart';

class IngenieriaScreen extends StatefulWidget {
  const IngenieriaScreen({super.key});

  @override
  State<IngenieriaScreen> createState() => _IngenieriaScreenState();
}

class _IngenieriaScreenState extends State<IngenieriaScreen> {
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
          ? const MobileDrawer(activeLink: 'Ingeniería')
          : null,
      body: Stack(
        children: [
          // Main Scrollable Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 80), // Offset for the fixed Navbar
                
                // 1. HERO SECTION
                IngenieriaHeroSection(
                  isDesktop: isDesktop,
                  scrollController: _scrollController,
                ),

                // 2. SERVICES SECTION (Grid with left sticky details)
                IngenieriaServicesSection(isDesktop: isDesktop),

                // 3. COMPROMISO SECTION (Technician image & stats)
                IngenieriaCompromisoSection(
                  isDesktop: isDesktop,
                  scrollController: _scrollController,
                ),

                // 4. CONTACT SECTION (Form)
                IngenieriaContactSection(isDesktop: isDesktop),

                // 5. FOOTER SECTION
                FooterSection(isDesktop: isDesktop),
              ],
            ),
          ),

          // Floating Sticky Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              isScrolled: _isScrolled,
              isDesktop: isDesktop,
              activeLink: 'Ingeniería',
            ),
          ),
        ],
      ),
    );
  }
}
