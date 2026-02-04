import 'package:flutter/material.dart';
import '../../core/theme.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width > 1200 ? 80.0 : 40.0;
    final crossAxisCount = width > 1200 ? 4 : (width > 600 ? 2 : 1);
    final childAspectRatio = width > 1200 ? 2.5 : (width > 600 ? 1.4 : 1.9);

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
          ),
          const SizedBox(height: 48),
          GridView.count(
            crossAxisCount: crossAxisCount,
            shrinkWrap: true,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: childAspectRatio,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildStackCard(context, 'MOBILE', ['Flutter', 'Dart']),
              _buildStackCard(context, 'STATE MANAGEMENT', ['BLoC', 'Provider', 'Riverpod']),
              _buildStackCard(context, 'BACKEND', ['Firebase', 'Supabase', 'Rest APIs']),
              _buildStackCard(context, 'ARCHITECTURE', ['MVVM', 'Clean Architecture', 'TDD']),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStackCard(BuildContext context, String category, List<String> items) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
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
          const SizedBox(height: 24),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: items.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  item,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
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
