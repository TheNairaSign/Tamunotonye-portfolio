import 'package:flutter/material.dart';
import '../../core/theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
      child: Column(
        children: [
          const Text(
            "Let's build something solid.",
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.w900,
              letterSpacing: -1.5,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Whether you have a question or just want to discuss your next big idea, my\ninbox is always open.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(context, Icons.link),
              const SizedBox(width: 20),
              _buildSocialIcon(context, Icons.terminal),
              const SizedBox(width: 20),
              _buildSocialIcon(context, Icons.email_outlined),
            ],
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Get in Touch',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 100),
          Divider(color: Theme.of(context).dividerColor),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© 2026 Tamunotonye Bob-Manuel. Built with Flutter & Passion.',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.4),
                  fontSize: 14,
                ),
              ),
              Row(
                children: [
                  _buildFooterLink(context, 'LinkedIn'),
                  const SizedBox(width: 24),
                  _buildFooterLink(context, 'Twitter'),
                  const SizedBox(width: 24),
                  _buildFooterLink(context, 'Dribbble'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(BuildContext context, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Theme.of(context).iconTheme.color, size: 24),
    );
  }

  Widget _buildFooterLink(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }
}
