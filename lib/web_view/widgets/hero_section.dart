import 'package:flutter/material.dart';
import '../../core/theme.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:web/web.dart' as web;

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onViewProjects});
  final VoidCallback onViewProjects;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width > 1200 ? 80.0 : 40.0;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 60),
      child: Row(
        children: [
          // Left Side
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'AVAILABLE FOR NEW OPPORTUNITIES',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
                const SizedBox(height: 24),
                Text(
                  'Tamunotonye Bob-Manuel',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: width > 1000 ? 52 : 40,
                    fontWeight: FontWeight.w900,
                    height: 1.1, 
                  ),
                ).animate().fadeIn(delay: 200.ms, duration: 600.ms).slideX(begin: -0.2),
                const SizedBox(height: 16),
                Text(
                  'Mobile App Developer | Flutter • Dart • \nFirebase • Clean Architecture',
                  style: TextStyle(
                    fontSize: width > 1000 ? 24 : 18,
                    color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
                    height: 1.4,
                  ),
                ).animate().fadeIn(delay: 400.ms, duration: 600.ms).slideX(begin: -0.2),
                const SizedBox(height: 32),
                Text(
                  'I build scalable, production-ready mobile applications with\na focus on performance and clean, maintainable code.',
                  style: TextStyle(
                    fontSize: width > 1000 ? 18 : 16,
                    color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                    height: 1.6,
                  ),
                ).animate().fadeIn(delay: 600.ms, duration: 600.ms).slideX(begin: -0.2),
                const SizedBox(height: 48),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: onViewProjects,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text('View Projects', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 16),
                    OutlinedButton(
                      onPressed: () => web.window.open('https://github.com/TheNairaSign', '_blank'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
                        side: BorderSide(color: Theme.of(context).dividerColor),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('GitHub', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                  ],
                ).animate().fadeIn(delay: 800.ms, duration: 600.ms)),
                const SizedBox(height: 24),
                // WakaTime as a "Fun Fact"
                InkWell(
                  onTap: () => web.window.open('https://wakatime.com/@Tybob', '_blank'),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.query_stats, size: 16, color: AppColors.primary.withValues(alpha: 0.6)),
                      const SizedBox(width: 8),
                      Text(
                        'Coding stats tracked with WakaTime',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.6),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 1000.ms, duration: 600.ms),
          // Right Side - Project Mockup
          Expanded(
            flex: 2,
            child: Container(
              height: 550,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    blurRadius: 100,
                    spreadRadius: 20,
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Phone Bezel
                  Container(
                    width: 260,
                    height: 520,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.1), width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.5),
                          blurRadius: 40,
                          offset: const Offset(0, 20),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Image.asset(
                        'assets/screenshots/thingsmatch/tm-dash-dark.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Floating Badge
                  Positioned(
                    bottom: 40,
                    right: 50,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Thingsmatch', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          Text('Swipe-to-give UI', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                        ],
                      ),
                    ).animate().slideX(begin: 0.5, delay: 1200.ms).fadeIn(),
                  ),
                ],
              ),
            ),
          ).animate().fadeIn(delay: 400.ms, duration: 1000.ms).scale(begin: const Offset(0.8, 0.8)),
        ]
      )
    );
  }
}

