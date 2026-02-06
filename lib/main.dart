import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'web_view/pages/portfolio_page_web.dart';
import 'mobile_view/pages/portfolio_page_mobile.dart';
import 'core/widgets/loading_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tamunotonye Bob-Manuel | Portfolio',
      theme: AppTheme.darkTheme(context),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return LoadingScreen(
        onComplete: () {
          setState(() {
            _isLoading = false;
          });
        },
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return const PortfolioPageMobile();
        }
        return const PortfolioPageWeb();
      },
    );
  }
}