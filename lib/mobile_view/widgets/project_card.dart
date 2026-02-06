import 'package:flutter/material.dart';
import 'package:portfolio/core/theme.dart';
import 'package:portfolio/web_view/models/project_data.dart';
import 'package:portfolio/web_view/pages/project_details_page.dart';
import 'package:portfolio/mobile_view/pages/project_details_page_mobile.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project});
  final ProjectData project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 800;
    final bool isSmallDesktop = width >= 800 && width < 1100;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isMobile) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProjectDetailsPageMobile(project: widget.project),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProjectDetailsPage(project: widget.project),
              ),
            );
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          clipBehavior: Clip.antiAlias,
          transform: Matrix4.identity()
            ..translate(0.0, _isHovered ? -12.0 : 0.0, 0.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(isMobile ? 16 : 24),
            border: Border.all(
              color: _isHovered
                  ? AppColors.primary.withValues(alpha: 0.3)
                  : Theme.of(context).dividerColor,
            ),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: widget.project.color.withValues(alpha: 0.1),
                  blurRadius: 30,
                  offset: const Offset(0, 20),
                  spreadRadius: -5,
                ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Image Placeholder
              if (!isMobile)
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.hardEdge,
                    alignment: Alignment.center,
                    children: [
                      // Subtle Gradient Background
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                widget.project.color.withValues(alpha: 0.2),
                                widget.project.color.withValues(alpha: 0.05),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Floating Mockup
                      AnimatedScale(
                        scale: _isHovered ? 1.05 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: Hero(
                          tag: 'project_icon_${widget.project.title}',
                          child: Center(
                            child: widget.project.screenshotsDark.isNotEmpty
                                ? Container(
                                    width: isSmallDesktop ? 90 : 120,
                                    height: isSmallDesktop ? 180 : 240,
                                    padding: const EdgeInsets.all(4), // Bezels
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.4),
                                          blurRadius: 20,
                                          offset: const Offset(0, 10),
                                        ),
                                      ],
                                      border: Border.all(
                                        color: Colors.white.withValues(alpha: 0.1),
                                        width: 1,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      clipBehavior: Clip.hardEdge,
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        widget.project.screenshotsDark.first,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Icon(
                                    Icons.apps,
                                    size: isSmallDesktop ? 48 : 64,
                                    color: Colors.white.withValues(alpha: 0.5),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              else
                AspectRatio(
                  aspectRatio: 2.0,
                  child: Stack(
                    clipBehavior: Clip.hardEdge,
                    alignment: Alignment.center,
                    children: [
                      // Subtle Gradient Background
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                widget.project.color.withValues(alpha: 0.2),
                                widget.project.color.withValues(alpha: 0.05),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Floating Mockup
                      AnimatedScale(
                        scale: _isHovered ? 1.05 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: Hero(
                          tag: 'project_icon_${widget.project.title}',
                          child: Center(
                            child: widget.project.screenshotsDark.isNotEmpty
                                ? Container(
                                    width: 70,
                                    height: 140,
                                    padding: const EdgeInsets.all(4), // Bezels
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.4),
                                          blurRadius: 20,
                                          offset: const Offset(0, 10),
                                        ),
                                      ],
                                      border: Border.all(
                                        color: Colors.white.withValues(alpha: 0.1),
                                        width: 1,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      clipBehavior: Clip.hardEdge,
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        widget.project.screenshotsDark.first,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Icon(
                                    Icons.apps,
                                    size: 48,
                                    color: Colors.white.withValues(alpha: 0.5),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsets.all(isMobile || isSmallDesktop ? 16 : 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.project.title,
                          style: TextStyle(
                            fontSize: isMobile || isSmallDesktop ? 18 : 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AnimatedRotation(
                          turns: _isHovered ? 0.02 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: Icon(
                            Icons.open_in_new,
                            size: 20,
                            color: _isHovered
                                ? AppColors.primary
                                : Theme.of(context).iconTheme.color?.withValues(alpha: 0.4),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.project.description,
                      style: TextStyle(
                        fontSize: isMobile || isSmallDesktop ? 13 : 16,
                        color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.tags.map((tag) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile || isSmallDesktop ? 8 : 12,
                            vertical: isMobile || isSmallDesktop ? 4 : 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            tag.toUpperCase(),
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: isMobile || isSmallDesktop ? 10 : 12,
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
        ),
      ),
    );
  }
}

