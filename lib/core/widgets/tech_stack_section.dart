import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width > 1200 ? 80.0 : 40.0;
    final crossAxisCount = width > 1200 ? 4 : (width > 600 ? 2 : 1);


    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tech Stack',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
          const SizedBox(height: 16),
          Text(
            'The tools and technologies I use to bring ideas to life.',
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
            ),
          ).animate().fadeIn(delay: 200.ms, duration: 600.ms),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              final cardWidth = (constraints.maxWidth - (crossAxisCount - 1) * 24) / crossAxisCount;
              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: [
                  _buildStackCard(context, 'MOBILE', ['Flutter', 'Dart'], cardWidth)
                      .animate().fadeIn(delay: 200.ms, duration: 600.ms).scale(begin: const Offset(0.9, 0.9)),
                  _buildStackCard(context, 'STATE MANAGEMENT', ['BLoC', 'Provider', 'Riverpod'], cardWidth)
                      .animate().fadeIn(delay: 400.ms, duration: 600.ms).scale(begin: const Offset(0.9, 0.9)),
                  _buildStackCard(context, 'BACKEND', ['Firebase', 'Supabase', 'Rest APIs'], cardWidth)
                      .animate().fadeIn(delay: 600.ms, duration: 600.ms).scale(begin: const Offset(0.9, 0.9)),
                  _buildStackCard(context, 'ARCHITECTURE', ['MVVM', 'Clean Architecture', 'TDD'], cardWidth)
                      .animate().fadeIn(delay: 800.ms, duration: 600.ms).scale(begin: const Offset(0.9, 0.9)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStackCard(BuildContext context, String category, List<String> items, double width) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: items.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  item,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
