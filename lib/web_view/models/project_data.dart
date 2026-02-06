import 'dart:ui';

class ProjectData {
  final String title;
  final String description;
  final String longDescription;
  final List<String> tags;
  final Color color;
  final String? githubUrl;
  final Map<String, String>? liveUrl;
  final List<String> screenshotsLight;
  final List<String> screenshotsDark;

  ProjectData({
    required this.title,
    required this.description,
    required this.longDescription,
    required this.tags,
    required this.color,
    this.githubUrl,
    this.liveUrl,
    this.screenshotsLight = const [],
    this.screenshotsDark = const [],
  });
}

final List<ProjectData> projectDetails = [
  ProjectData(
    title: 'Airdesk',
    description: 'A free file sharing platform between internet devices',
    longDescription:
        'Airdesk is a high-performance file sharing solution built to handle rapid data transfer between multiple devices on the same network. It leverages custom REST APIs and Riverpod for robust state management, ensuring a seamless user experience across mobile and web platforms.',
    tags: ['REST APIs', 'Riverpod', 'WebSockets'],
    color: const Color(0xFF3498DB),
    githubUrl: 'https://github.com/alexrivers/airdesk',
    screenshotsLight: ['assets/screenshots/airdesk/airdesk-dash-light.jpg'],
    screenshotsDark: ['assets/screenshots/airdesk/airdesk-dash-dark.jpg'],
  ),
  // ProjectData(
  //   title: 'Vennloop',
  //   description:
  //       'A secure video conferencing networking platform for Consultants and Clients',
  //   longDescription:
  //       'Vennloop revolutionizes consultant-client interactions with encrypted video conferencing and real-time scheduling. Integrated with Agora SDK for high-quality video and Socket.io for low-latency messaging, it provides a professional-grade communication environment.',
  //   tags: ['Agora SDK', 'Socket.io', 'Firebase', 'Clean Arch'],
  //   color: const Color(0xFF9B59B6),
  //   liveUrl: 'https://vennloop.com',
  //   screenshotsLight: [],
  //   screenshotsDark: [],
  // ),
  ProjectData(
    title: 'Taskflow',
    description:
        'A platform designed to help small teams organize, schedule, and manage tasks efficiently, combining API-driven data, clean architecture, and a modern, intuitive user interface.',
    longDescription:
        'Taskflow is a comprehensive project management solution built to streamline collaboration for small teams. It combines robust task organization and scheduling with a clean, intuitive interface. Leveraging API-driven data fetching and adhering to Clean Architecture principles, Taskflow ensures scalability, maintainability, and a seamless user experience across all functions.',
    tags: ['Firebase', 'Provider'],
    color: const Color(0xFF9B59B6),
    liveUrl: {},
    screenshotsLight: [
      'assets/screenshots/taskflow/tf-dash-light.jpg',
      'assets/screenshots/taskflow/tf-schedule-light.jpg',
      'assets/screenshots/taskflow/tf-teams-light.jpg',
      'assets/screenshots/taskflow/tf-settings-light.jpg',
    ],
    screenshotsDark: [
      'assets/screenshots/taskflow/tf-dash-dark.jpg',
      'assets/screenshots/taskflow/tf-schedule-dark.jpg',
      'assets/screenshots/taskflow/tf-teams-dark.jpg',
      'assets/screenshots/taskflow/tf-settings-dark.jpg',
    ],
  ),

  ProjectData(
    title: 'Cluttercut',
    description:
        'A file duplicate cleaner with filtering algorithms for pinpointing exact duplicates',
    longDescription:
        'Cluttercut is a powerful storage optimization tool designed to identify and remove duplicate files with precision. Using advanced hashing algorithms and smart filters, it helps users reclaim valuable space while ensuring that important data remains safe.',
    tags: ['Riverpod', 'Isar', 'Multithreading'],
    color: const Color(0xFF9B59B6),
    screenshotsLight: [
      'assets/screenshots/cluttercut/cc-dash-light.jpg',
      'assets/screenshots/cluttercut/cc-bin-light.jpg',
    ],
    screenshotsDark: [
      'assets/screenshots/cluttercut/cc-dash-dark.jpg',
      'assets/screenshots/cluttercut/cc-recycle-dark.jpg',
    ],
    githubUrl: 'https://github.com/TheNairaSign/clutter-cut'
  ),
  ProjectData(
    title: 'Natcycle',
    description:
        'A global recycling platform for waste management including waste management centers, recyclying dropoff centers and campaigns for waste management',
    longDescription:
        'Natcycle is a comprehensive waste management platform connecting users with recycling centers and environmental campaigns. It facilitates finding drop-off locations, tracking recycling habits, and joining community initiatives for a greener planet.',
    tags: ['Provider', 'Google Maps', 'ChatBot', 'OfflineSync'],
    color: const Color(0xFFF1C40F),
    githubUrl: 'https://github.com/alexrivers/natcycle',
    screenshotsLight: [
      'assets/screenshots/natcycle/natcycle-dash-light.jpg',
      'assets/screenshots/natcycle/natcycle-map-light.jpg',
      'assets/screenshots/natcycle/natcycle-map-details-light.jpg',
    ],
    screenshotsDark: [
      'assets/screenshots/natcycle/natcycle-dash-dark.jpg',
      'assets/screenshots/natcycle/natcycle-map-dark.jpg',
      'assets/screenshots/natcycle/natcycle-map-details-dark.jpg',
    ],
  ),
  ProjectData(
    title: 'Thingsmatch',
    description:
        'Got an item you want to give out for free? Thingsmatch provides the platform for you to find a taker with a tinder-swipe interface.',
    longDescription:
        'Thingsmatch gamifies the process of giving away unwanted items. By using a Tinder-like swipe interface, it connects donors with people who need their items, promoting sustainability and community sharing while reducing waste.',
    tags: ['Flutter', 'Swipe UI', 'Socket.io'],
    color: const Color(0xFFE74C3C),
    screenshotsLight: [
      'assets/screenshots/thingsmatch/tm-dash-light.jpg',
      'assets/screenshots/thingsmatch/tm-details-light.jpg',
      'assets/screenshots/thingsmatch/tm-impact-light.jpg',
    ],
    screenshotsDark: [
      'assets/screenshots/thingsmatch/tm-dash-dark.jpg',
      'assets/screenshots/thingsmatch/tm-details-dark.jpg',
      'assets/screenshots/thingsmatch/tm-impact-dark.jpg',
    ],
    liveUrl: {
      'ios' : '',
      'android' : ''
    }
  ),
  ProjectData(
    title: 'Loop',
    description:
        'An offline-first app for intentional connection with smart reminders and safety features.',
    longDescription:
        'Loop helps users maintain meaningful relationships through intelligent contact tracking. Built with BLoC and Isar Database, it ensures data privacy while providing powerful reminders, safety alerts, and seamless cloud backups.',
    tags: ['BLoC', 'Isar', 'Firebase', 'LocalFirst'],
    color: const Color(0xFF1ABC9C),
    githubUrl: 'https://github.com/alexrivers/loop',
    screenshotsLight: [
      'assets/screenshots/loop/loop-dash-light.jpg',
      'assets/screenshots/loop/loop-activity-light.jpg',
      'assets/screenshots/loop/loop-call-light.jpg',
      'assets/screenshots/loop/loop-relationship-light.jpg',
    ],
    screenshotsDark: [
      'assets/screenshots/loop/loop-dash-dark.jpg',
      'assets/screenshots/loop/loop-activity-dark.jpg',
      'assets/screenshots/loop/loop-call-dark.jpg',
      'assets/screenshots/loop/loop-relationship-dark.jpg',
    ],
  ),
];
