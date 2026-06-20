import 'package:flutter/material.dart';
import 'package:jocar_web/widgets/widgets.dart';

// --- MAIN SCREEN ---
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  // GlobalKeys for Smooth Scrolling
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _identidadKey = GlobalKey();
  final GlobalKey _serviciosKey = GlobalKey();
  final GlobalKey _contactoKey = GlobalKey();

  String _activeSection = 'Inicio';

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
    if (_scrollController.offset > 50) {
      if (!_isScrolled) {
        setState(() {
          _isScrolled = true;
        });
      }
    } else {
      if (_isScrolled) {
        setState(() {
          _isScrolled = false;
        });
      }
    }

    final double offset = _scrollController.offset;
    if (offset < 400) {
      _updateActiveSection('Inicio');
    } else if (offset >= 400 && offset < 1100) {
      _updateActiveSection('Identidad');
    } else if (offset >= 1100 && offset < 2200) {
      _updateActiveSection('Servicios');
    } else {
      _updateActiveSection('Contacto');
    }
  }

  void _updateActiveSection(String section) {
    if (_activeSection != section) {
      setState(() {
        _activeSection = section;
      });
    }
  }

  void _scrollToSection(GlobalKey key, BuildContext context) {
    if (Scaffold.of(context).isEndDrawerOpen) {
      Navigator.of(context).pop();
    }

    final targetContext = key.currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

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
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeroSection(
                  key: _heroKey,
                  isDesktop: isDesktop,
                  onSolucionesTap: () =>
                      _scrollToSection(_serviciosKey, context),
                  onMisionTap: () => _scrollToSection(_identidadKey, context),
                ),
                IdentitySection(key: _identidadKey, isDesktop: isDesktop),
                ServicesSection(
                  key: _serviciosKey,
                  isDesktop: isDesktop,
                  onContactTap: () => _scrollToSection(_contactoKey, context),
                ),
                CTASection(
                  isDesktop: isDesktop,
                  onContactTap: () => _scrollToSection(_contactoKey, context),
                ),
                ContactSection(key: _contactoKey, isDesktop: isDesktop),
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
