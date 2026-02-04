import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/philosophy_section.dart';
import '../widgets/tech_stack_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/footer_section.dart';

class PortfolioPageWeb extends StatefulWidget {
  const PortfolioPageWeb({super.key});

  @override
  State<PortfolioPageWeb> createState() => _PortfolioPageWebState();
}

class _PortfolioPageWebState extends State<PortfolioPageWeb> {
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey techStackKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutQuart,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(
              onProjectsTap: () => scrollToSection(projectsKey),
              onAboutTap: () => scrollToSection(aboutKey),
              onTechStackTap: () => scrollToSection(techStackKey),
              onContactTap: () => scrollToSection(contactKey),
            ),
            HeroSection(onViewProjects: () => scrollToSection(projectsKey)),
            PhilosophySection(key: aboutKey),
            TechStackSection(key: techStackKey),
            ProjectsSection(key: projectsKey),
            FooterSection(key: contactKey),
          ],
        ),
      ),
    );
  }
}
