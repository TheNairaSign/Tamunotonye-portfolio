import 'package:flutter/material.dart';
import '../../core/theme.dart';

import 'package:web/web.dart' as web;

class NavBar extends StatelessWidget {
  final VoidCallback onProjectsTap;
  final VoidCallback onAboutTap;
  final VoidCallback onTechStackTap;
  final VoidCallback onContactTap;

  const NavBar({
    super.key,
    required this.onProjectsTap,
    required this.onAboutTap,
    required this.onTechStackTap,
    required this.onContactTap,
  });


void openPdf() {
  final url = 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf';
  web.window.open(url, '_blank');
}


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.code, color: Colors.black, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'Tamunotonye Bob-Manuel',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          const Spacer(),

          _buildNavLink(context, 'Projects', onProjectsTap),
          _buildNavLink(context, 'About', onAboutTap),
          _buildNavLink(context, 'Tech Stack', onTechStackTap),
          _buildNavLink(context, 'Contact', onContactTap),
          const SizedBox(width: 30),

          ElevatedButton(
            onPressed: () => openPdf(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Resume',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavLink(BuildContext context, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium?.color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
