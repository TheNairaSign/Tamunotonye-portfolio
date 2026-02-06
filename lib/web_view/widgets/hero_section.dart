import 'package:flutter/material.dart';
import '../../core/theme.dart';

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
                ),
                const SizedBox(height: 24),
                Text(
                  'Tamunotonye Bob-Manuel',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: width > 1000 ? 52 : 40,
                    fontWeight: FontWeight.w900,
                    height: 1.1, 
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Mobile App Developer | Flutter • Dart • \nFirebase • Clean Architecture',
                  style: TextStyle(
                    fontSize: width > 1000 ? 24 : 18,
                    color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'I build scalable, production-ready mobile applications with\na focus on performance and clean, maintainable code.',
                  style: TextStyle(
                    fontSize: width > 1000 ? 18 : 16,
                    color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                    height: 1.6,
                  ),
                ),
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
                    const SizedBox(width: 20),
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
                    const SizedBox(width: 20),
                    OutlinedButton(
                      onPressed: () => web.window.open('https://wakatime.com/@Tybob', '_blank'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
                        side: BorderSide(color: Theme.of(context).dividerColor),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('WakaTime', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Right Side - Image Mockup
          Expanded(
            flex: 2,
            child: Container(
              height: 500,
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/hero_mockup.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
