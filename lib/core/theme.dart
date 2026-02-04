import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color background = Color(0xFF0A0A0A);
  static const Color cardBackground = Color(0xFF161616);
  static const Color primary = Color(0xFF00FF7F);
  static const Color textMain = Colors.white;
  static const Color textSecondary = Colors.white70;
  static const Color divider = Colors.white12;
}

class AppTheme {
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0F0F0F),
        elevation: 0,
      ),
      textTheme: GoogleFonts.outfitTextTheme(Theme.of(context).textTheme).apply(
        bodyColor: AppColors.textMain,
        displayColor: AppColors.textMain,
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        surface: AppColors.cardBackground,
        onSurface: AppColors.textMain,
        onPrimary: Colors.black,
      ),
      dividerColor: AppColors.divider,
    );
  }
}
