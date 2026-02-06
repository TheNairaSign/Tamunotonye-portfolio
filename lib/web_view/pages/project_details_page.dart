import 'package:flutter/material.dart';
import 'package:portfolio/core/theme.dart';
import 'package:portfolio/web_view/models/project_data.dart';
import 'package:web/web.dart' as web;

class ProjectDetailsPage extends StatefulWidget {
  final ProjectData project;

  const ProjectDetailsPage({super.key, required this.project});

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  bool _isLightMockup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 60),
                  _buildMainContent(context),
                  const SizedBox(height: 80),
                  _buildScreenshotGallery(context),
                  const SizedBox(height: 80),
                  _buildActionButtons(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      backgroundColor: const Color(0xFF0F0F0F),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          widget.project.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        titlePadding: const EdgeInsets.only(left: 60, bottom: 16),
        centerTitle: false,
        background: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    widget.project.color.withValues(alpha: 0.4),
                    AppColors.background,
                  ],
                ),
              ),
            ),
            Center(
              child: Hero(
                tag: 'project_icon_${widget.project.title}',
                child: widget.project.screenshotsDark.isNotEmpty
                    ? Container(
                        width: 150,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: widget.project.color.withValues(alpha: 0.3),
                              blurRadius: 40,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            widget.project.screenshotsDark.first,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Icon(
                        Icons.apps,
                        size: 150,
                        color: widget.project.color.withValues(alpha: 0.8),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.project.title,
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.w900,
            letterSpacing: -1.5,
            color: Theme.of(context).textTheme.displayLarge?.color,
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: widget.project.tags.map((tag) => _buildTag(tag)).toList(),
        ),
      ],
    );
  }

  Widget _buildTag(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: widget.project.color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: widget.project.color.withValues(alpha: 0.3)),
      ),
      child: Text(
        tag,
        style: TextStyle(
          color: widget.project.color,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About the Project',
                style: TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.headlineMedium?.color,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                widget.project.longDescription,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).textTheme.bodyLarge?.color?.withValues(alpha: 0.8),
                  height: 1.8,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 100),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Theme.of(context).dividerColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tech Specs',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                _buildTechItem(Icons.code, 'Flutter & Dart'),
                _buildTechItem(Icons.storage, 'State Management'),
                _buildTechItem(Icons.cloud, 'Backend Services'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTechItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: widget.project.color, size: 20),
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildScreenshotGallery(BuildContext context) {
    final screenshots = _isLightMockup ? widget.project.screenshotsLight : widget.project.screenshotsDark;

    if (screenshots.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Visual Showcase',
              style: TextStyle(
                fontSize: 32, 
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.headlineMedium?.color,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColors.divider),
              ),
              child: Row(
                children: [
                  const Icon(Icons.dark_mode_rounded, size: 16, color: Colors.white54),
                  const SizedBox(width: 8),
                  Switch(
                    value: _isLightMockup,
                    onChanged: (val) => setState(() => _isLightMockup = val),
                    activeColor: AppColors.primary,
                    activeTrackColor: AppColors.primary.withValues(alpha: 0.2),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.light_mode_rounded, size: 16, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 48),
        SizedBox(
          height: 600,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: screenshots.length,
            separatorBuilder: (_, __) => const SizedBox(width: 32),
            itemBuilder: (context, index) {
              return Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Theme.of(context).dividerColor),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    screenshots[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        if (widget.project.githubUrl != null)
          _buildActionButton(
            'View on GitHub',
            Icons.logo_dev,
            () => web.window.open(widget.project.githubUrl!, '_blank'),
            true,
          ),
        const SizedBox(width: 24),
        // if (widget.project.liveUrl != null)
        //   _buildActionButton(
        //     'Live Demo',
        //     Icons.launch,
        //     () => web.window.open(widget.project.liveUrl!, '_blank'),
        //     false,
        //   ),
      ],
    );
  }

  Widget _buildActionButton(String label, IconData icon, VoidCallback onTap, bool isPrimary) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? AppColors.primary : Colors.transparent,
        foregroundColor: isPrimary ? Colors.black : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 28),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: isPrimary ? BorderSide.none : const BorderSide(color: Colors.white24),
        ),
        elevation: 0,
      ).copyWith(
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
