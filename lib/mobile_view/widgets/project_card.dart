import 'package:flutter/material.dart';
import 'package:portfolio/core/theme.dart';
import 'package:portfolio/web_view/models/project_data.dart';
import 'package:portfolio/web_view/pages/project_details_page.dart';

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
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectDetailsPage(project: widget.project),
            ),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()
            ..translate(0.0, _isHovered ? -12.0 : 0.0, 0.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(24),
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
              Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Subtle Gradient Background
                      Container(
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
                      // Floating Mockup
                      AnimatedScale(
                        scale: _isHovered ? 1.05 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: Hero(
                          tag: 'project_icon_${widget.project.title}',
                          child: Center(
                            child: widget.project.screenshotsDark.isNotEmpty
                                ? Container(
                                    width: 120,
                                    height: 240,
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
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        widget.project.screenshotsDark.first,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Icon(
                                    Icons.apps,
                                    size: 64,
                                    color: Colors.white.withValues(alpha: 0.5),
                                  ),
                          ),
                        ),
                      ),
                    ],
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
                          widget.project.title,
                          style: const TextStyle(
                            fontSize: 24,
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
                    const SizedBox(height: 16),
                    Text(
                      widget.project.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.tags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            tag.toUpperCase(),
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
        ),
      ),
    );
  }
}

