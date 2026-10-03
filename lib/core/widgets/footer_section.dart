import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/web.dart' as web;
import '../theme.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  bool _showContactInfo = false;

  void _launchURL(String url) {
    web.window.open(url, '_blank');
  }

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
          ).animate().fadeIn(duration: 600.ms).scale(begin: const Offset(0.9, 0.9)),
          const SizedBox(height: 24),
          Text(
            "Whether you have a question or just want to discuss your next big idea, my\ninbox is always open.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width > 1000 ? 18 : 16,
              color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
              height: 1.6,
            ),
          ).animate().fadeIn(delay: 200.ms, duration: 600.ms),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(context, Icons.terminal, "https://github.com/TheNairaSign"),
              const SizedBox(width: 20),
              _buildSocialIcon(context, Icons.link, "https://linkedin.com/in/tamunotonye-bob-manuel"),
              const SizedBox(width: 20),
              _buildSocialIcon(context, Icons.email_outlined, "mailto:tonyebobmanuel2@gmail.com"),
            ],
          ).animate().fadeIn(delay: 400.ms, duration: 600.ms).slideY(begin: 0.2),
          const SizedBox(height: 48),
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
              child: Text(
                _showContactInfo ? 'Close Contact' : 'Get in Touch',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                          _buildContactDetail(
                            context,
                            Icons.email,
                            "tonyebobmanuel2@gmail.com",
                            onTap: () async {
                              final Uri emailLaunchUri = Uri(
                                scheme: 'mailto',
                                path: 'tonyebobmanuel2@gmail.com',
                              );
                              if (!await launchUrl(emailLaunchUri)) {
                                debugPrint('Could not launch email');
                              }
                            },
                          ),
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
                  spacing: 24,
                  children: [
                    _buildFooterLink(context, 'LinkedIn', onTap: () => _launchURL('https://linkedin.com/in/tamunotonye-bob-manuel')),
                    _buildFooterLink(context, 'GitHub', onTap: () => _launchURL('https://github.com/TheNairaSign')),
                    _buildFooterLink(context, 'Download Resume', onTap: () => _launchURL('resume.pdf')),
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
                  spacing: 24,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildFooterLink(context, 'LinkedIn', onTap: () => _launchURL('https://linkedin.com/in/tamunotonye-bob-manuel')),
                    _buildFooterLink(context, 'GitHub', onTap: () => _launchURL('https://github.com/TheNairaSign')),
                    _buildFooterLink(context, 'Download Resume', onTap: () => _launchURL('resume.pdf')),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(BuildContext context, IconData icon, String url) {
    return InkWell(
      onTap: () => url.startsWith('mailto:') ? launchUrl(Uri.parse(url)) : _launchURL(url),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Icon(icon, color: AppColors.primary, size: 24),
      ),
    );
  }

  Widget _buildFooterLink(BuildContext context, String title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildContactDetail(
    BuildContext context,
    IconData icon,
    String text, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
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
        ),
      ),
    );
  }
}
