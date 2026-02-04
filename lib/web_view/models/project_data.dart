import 'dart:ui';

class ProjectData {
  final String title;
  final String description;
  final List<String> tags;
  final Color color;

  ProjectData({
    required this.title,
    required this.description,
    required this.tags,
    required this.color,
  });
}

final List<ProjectData> projectDetails = [
  ProjectData(
    title: 'Airdesk',
    description:
        'A free file sharing platform between internet devices',
    tags: ['REST APIs', 'Riverpod'],
    color: const Color(0xFF3498DB),
  ),
  ProjectData(
    title: 'Vennloop',
    description:
        'A secure video conferencing networking platform for Consultants and Clients',
    tags: ['REST APIs', 'Agora SDK', 'Socket.io', 'Firebase Notifications'],
    color: const Color(0xFF3498DB),
  ),
  ProjectData(
      title: 'Natcycle',
      description:
          'A collaborative project management tool for remote teams with offline-first capabilities and real-time syncing across devices.',
      tags: ['PROVIDER', 'Google Maps SDK', 'ChatBot'],
      color: const Color(0xFFF1C40F),
    ),
  ProjectData(
      title: 'Thingsmatch',
      description:
          'High-fidelity music streaming application with background playback, custom audio effects, and smart playlist generation.',
      tags: ['Feature-First', 'Socket.io', 'Firebase Notifications'],
      color: const Color(0xFFE74C3C),
    ),
  ProjectData(
    title: 'Loop',
    description:
        'An offline-first app that helps you intentionally stay connected with the people who matter through smart contact reminders, safety features, and optional communication tools.',
    tags: ['BLOC', 'ISAR', 'Firebase Notifications'],
    color: const Color(0xFF1ABC9C),
  ),
  // ProjectData(
  //   title: 'TaskFlow',
  //   description:
  //       'designed to help small teams organize, schedule, and manage tasks efficiently, combining API-driven data, clean architecture, and a modern, intuitive user interface.',
  //   tags: ['BLOC', 'ISAR', 'Firebase Notifications'],
  //   color: const Color(0xFF1ABC9C),
  // ),
];
