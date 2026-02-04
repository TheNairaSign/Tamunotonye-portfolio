import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/philosophy_section.dart';
import '../widgets/tech_stack_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/footer_section.dart';

class PortfolioPageWeb extends StatelessWidget {
  const PortfolioPageWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            NavBar(),
            HeroSection(),
            PhilosophySection(),
            TechStackSection(),
            ProjectsSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
