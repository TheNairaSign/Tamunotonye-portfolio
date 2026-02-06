import 'package:flutter/material.dart';
import '../../core/theme.dart';

class PhilosophySection extends StatelessWidget {
  const PhilosophySection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width > 1200 ? 80.0 : (width > 600 ? 40.0 : 20.0);
    final verticalPadding = width > 900 ? 100.0 : 60.0;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ENGINEERING PHILOSOPHY',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 32),
          if (width > 900)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Engineering is more than just writing code; It\'s about building systems that scale. I specialize in production-grade applications where clean architecture meets high-performance engineering. By mastering BloC and Clean Architecture, I ensure every feature is testable, fluid, and built to evolve.',
                    style: TextStyle(
                      fontSize: width > 1200 ? 32 : 28,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(width: 80),
                Expanded(
                  child: Column(
                    children: [
                      _buildPoint(
                        context,
                        Icons.architecture,
                        'Scalable Architecture',
                        'Implementing Clean Architecture for modular, testable, and maintainable systems.',
                      ),
                      const SizedBox(height: 40),
                      _buildPoint(
                        context,
                        Icons.speed,
                        'Performance First',
                        'Optimizing for 60 FPS and efficient resource management for a premium feel.',
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Engineering is more than just writing code; it\'s about building systems that scale. I specialize in production-grade applications where clean architecture meets high-performance engineering.',
                  style: TextStyle(
                    fontSize: width > 600 ? 28 : 22,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 48),
                _buildPoint(
                  context,
                  Icons.architecture,
                  'Scalable Architecture',
                  'Implementing Clean Architecture for modular, testable, and maintainable systems.',
                ),
                const SizedBox(height: 32),
                _buildPoint(
                  context,
                  Icons.speed,
                  'Performance First',
                  'Optimizing for 60 FPS and efficient resource management for a premium feel.',
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildPoint(BuildContext context, IconData icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
