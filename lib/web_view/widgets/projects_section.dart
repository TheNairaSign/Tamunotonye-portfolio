import 'package:flutter/material.dart';
import '../../core/theme.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Featured Projects',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            crossAxisSpacing: 32,
            mainAxisSpacing: 32,
            childAspectRatio: 1.1,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildProjectCard(
                'Vigor Health Tracker',
                'A comprehensive fitness companion that integrates with health APIs to provide real-time performance analytics and personalized workout plans.',
                ['BLOC', 'FIREBASE', 'FLUTTER'],
                const Color(0xFF1ABC9C),
              ),
              _buildProjectCard(
                'Nexus Bank',
                'Secured banking platform featuring biometric authentication, real-time transaction alerts, and multi-currency digital wallet support.',
                ['CLEAN ARCH', 'SECURITY', 'SUPABASE'],
                const Color(0xFF3498DB),
              ),
              _buildProjectCard(
                'Orbit Task',
                'A collaborative project management tool for remote teams with offline-first capabilities and real-time syncing across devices.',
                ['PROVIDER', 'SQLITE', 'REALTIME'],
                const Color(0xFFF1C40F),
              ),
              _buildProjectCard(
                'Echo Stream',
                'High-fidelity music streaming application with background playback, custom audio effects, and smart playlist generation.',
                ['AUDIO ENGINE', 'C++ INTEROP', 'GRAPHQL'],
                const Color(0xFFE74C3C),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String description, List<String> tags, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image Placeholder
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [color.withOpacity(0.6), color.withOpacity(0.2)],
                ),
              ),
              child: Center(
                child: Icon(Icons.apps, size: 64, color: Colors.white.withOpacity(0.5)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.open_in_new, size: 20, color: Colors.white.withOpacity(0.4)),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary.withOpacity(0.7),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: tags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
