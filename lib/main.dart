import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'web_view/pages/portfolio_page_web.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tamunotonye Bob-Manuel | Portfolio',
      theme: AppTheme.darkTheme,
      home: const PortfolioPageWeb(),
    );
  }
}