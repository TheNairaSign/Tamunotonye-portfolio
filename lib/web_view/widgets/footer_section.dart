import 'package:flutter/material.dart';
import '../../core/theme.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  bool _showContactInfo = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width > 1200 ? 80.0 : 40.0;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 100),
      child: Column(
        children: [
           Text(
            "Let's build something solid.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width > 1000 ? 64 : (width > 600 ? 48 : 36),
              fontWeight: FontWeight.w900,
              letterSpacing: -1.5,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Whether you have a question or just want to discuss your next big idea, my\ninbox is always open.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width > 1000 ? 18 : 16,
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
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showContactInfo = !_showContactInfo;
                  });
                },
              style: ElevatedButton.styleFrom(
                backgroundColor:AppColors.primary,
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
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: SizedBox(
                  height: _showContactInfo ? null : 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: AnimatedOpacity(
                      opacity: _showContactInfo ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: Column(
                        children: [
                          _buildContactDetail(context, Icons.phone, "+234 8141389878"),
                          const SizedBox(height: 12),
                          _buildContactDetail(context, Icons.email, "tonyebobmanuel2@gmail.com"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
          Divider(color: Theme.of(context).dividerColor),
          const SizedBox(height: 40),
          if (width > 800)
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
            )
          else
            Column(
              children: [
                Text(
                  '© 2026 Tamunotonye Bob-Manuel.\nBuilt with Flutter & Passion.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.4),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
        color: Colors.white.withValues(alpha: 0.05),
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

  Widget _buildContactDetail(BuildContext context, IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.primary, size: 20),
        const SizedBox(width: 12),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).textTheme.bodyMedium?.color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
