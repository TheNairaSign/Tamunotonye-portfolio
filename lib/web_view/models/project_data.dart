import 'dart:ui';

// Project copy is sourced from the evidence-backed case studies in
// ~/Project Files/project_portfolio/<project>_portfolio.md. Every claim here
// should trace back to that project's evidence log — don't add features,
// metrics, or technologies the code doesn't actually have.

class ProjectHighlight {
  final String title;
  final String description;

  const ProjectHighlight({required this.title, required this.description});
}

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

  /// What I personally did on the project.
  final String? role;

  /// The single hardest problem and how it was solved.
  final String? challenge;

  /// Project-specific engineering highlights shown on the details page.
  final List<ProjectHighlight> highlights;

  /// Technologies actually imported/used in the codebase.
  final List<String> stack;

  /// Shown in place of the GitHub button when the repo isn't public.
  final String? repoNote;

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
    this.role,
    this.challenge,
    this.highlights = const [],
    this.stack = const [],
    this.repoNote,
  });
}

final List<ProjectData> projectDetails = [
  ProjectData(
    title: 'Natcycle',
    description:
        'A recycling platform for logging drop-offs, finding collection points and campaigns, and tracking environmental impact.',
    longDescription:
        'Natcycle is a cross-platform Flutter app backed by a live production API. Users log drop-offs and pick-ups of recyclables, discover collection points and campaign events on a map, track their impact over time, and get help from an in-app AI assistant. Built solo over ~18 months (128 commits).',
    tags: ['Provider', 'Google Maps', 'AI Assistant', 'Shorebird'],
    color: const Color(0xFFF1C40F),
    role:
        'Sole mobile developer — architecture, feature implementation, UI/UX, and CI/release setup.',
    challenge:
        'Turning an AI chat into something that can act on the app: the assistant (a separate AI microservice) returns structured tool calls such as navigateTo or setFilter, which the client parses, groups into independent actions, and executes — driving in-app navigation and map filtering from a single reply.',
    highlights: [
      ProjectHighlight(
        title: 'Material-aware map markers',
        description:
            'Google Maps markers are generated per material type and facility class so users can tell at a glance what a pin accepts, with icons cached by a computed key to avoid regenerating bitmaps on rebuild.',
      ),
      ProjectHighlight(
        title: 'Stale-while-revalidate caching',
        description:
            'A SharedPreferences-backed cache renders saved profile, campaign, and location data immediately while a fresh fetch runs in the background, keeping the app responsive on slow connections.',
      ),
      ProjectHighlight(
        title: 'OTA release pipeline',
        description:
            'GitHub Actions gates every push on flutter analyze, then ships a Shorebird code-push patch — decoupling most fixes from app-store review — and builds full releases on version tags.',
      ),
      ProjectHighlight(
        title: 'Session-aware networking',
        description:
            'Bearer tokens are injected by a Dio interceptor, and a typed auth wrapper turns 401/403 responses into a SessionExpiredException that forces re-authentication.',
      ),
    ],
    stack: [
      'Flutter & Dart',
      'Provider',
      'Dio + http',
      'Google Maps SDK',
      'Shorebird',
      'GitHub Actions',
    ],
    repoNote: 'Private repository',
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
        'A Tinder-style swipe marketplace for giving away items, with matching, real-time chat, and pickup coordination.',
    longDescription:
        'Thingsmatch applies a swipe interface to giving away physical items. Users swipe through nearby items, send an interest message, get matched with the owner, arrange pickup over real-time chat, and confirm the hand-off. It runs as a companion app to Natcycle, sharing its production backend through a two-step token exchange. Built solo over ~16 months (184 commits).',
    tags: ['Riverpod', 'Socket.IO', 'Mapbox', 'FCM'],
    color: const Color(0xFFE74C3C),
    role:
        'Sole mobile developer — architecture, feature implementation, UI/UX, and release engineering.',
    challenge:
        'Making chat feel instant on unreliable networks: messages appear immediately in a "sending" state with a temporary id, are marked failed after a 10-second timeout without a server echo, and are reconciled against the echo when it arrives — on top of a room-per-match Socket.IO client with its own exponential-backoff reconnection.',
    highlights: [
      ProjectHighlight(
        title: 'Server-authoritative matching',
        description:
            'A right-swipe waits for the user to choose an interest message before committing. Match state is never computed on the client; it follows a backend state machine (pending → confirmed → completed → thanked).',
      ),
      ProjectHighlight(
        title: 'Push notifications in every app state',
        description:
            'FCM is handled in foreground, background, and cold start, including the iOS APNS-token delay. A 10-second dedup set stops FCM and socket notifications firing twice for the same event.',
      ),
      ProjectHighlight(
        title: 'Trust & safety',
        description:
            'Backend-integrated report and block/unblock flows, a blocked-users screen, and a moderation menu that reflects live server state.',
      ),
      ProjectHighlight(
        title: 'Google Maps → Mapbox migration',
        description:
            'Moved mapping to Mapbox mid-project, with camera control and a custom search-radius overlay feeding geo-filtered, debounced item discovery.',
      ),
    ],
    stack: [
      'Flutter & Dart',
      'Riverpod (StateNotifier)',
      'Socket.IO',
      'Drift (SQLite)',
      'Mapbox SDK',
      'Firebase Cloud Messaging',
    ],
    repoNote: 'Private repository',
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
  ),
  ProjectData(
    title: 'Binocle',
    description:
        'A map-first app for pinning activities, objects, and people to real-world areas ("scapes") on an interactive Mapbox map.',
    longDescription:
        'Binocle is a geospatial content layer. A "scape" is a bounded area that users subscribe to and fill with typed pins: recurring activities, cataloged physical objects, or people offering a real-world function. Tapping inside a scape reverse-geocodes the spot and opens a multi-step pin-creation flow. Built solo over ~11 months.',
    tags: ['Mapbox', 'BLoC', 'go_router', 'Freezed'],
    color: const Color(0xFF3498DB),
    role:
        'Sole mobile developer — architecture, domain modeling, feature implementation, UI/UX, and backend-integration debugging.',
    challenge:
        'Diagnosing three unrelated map bugs from a screen recording: markers drifting to the wrong city at low zoom (longitudes pre-shifted at creation time), markers rendering ~3x too large (an uncompensated capture pixel ratio), and pin attributes silently dropped (a JSON string nested inside an array).',
    highlights: [
      ProjectHighlight(
        title: 'Widget-rendered map markers',
        description:
            'Each marker is a real Flutter widget (avatar + label) rendered offscreen and captured to PNG with RenderRepaintBoundary, so any pin can show any photo and title. Images are cached and batch-loaded in parallel.',
      ),
      ProjectHighlight(
        title: 'Procedural map effects',
        description:
            'A diagonal-stripe texture drawn with dart:ui Canvas greys out everything outside the active scape via a GeoJSON mask. A generated lat/lng grid and globe projection handle the wide-zoom view.',
      ),
      ProjectHighlight(
        title: 'Geometry-gated interaction',
        description:
            'A ray-casting point-in-polygon check decides whether a map tap may open the pin-creation flow.',
      ),
      ProjectHighlight(
        title: 'Backend-driven attributes',
        description:
            'Object pins carry dynamic {title, value} attribute lists defined by the backend and rendered generically, with no hardcoded fields.',
      ),
    ],
    stack: [
      'Flutter & Dart',
      'Mapbox Maps SDK',
      'flutter_bloc + Provider + Riverpod',
      'Dio + http',
      'freezed / json_serializable',
      'go_router',
    ],
    repoNote: 'Private repository',
  ),
  ProjectData(
    title: 'Loop',
    description:
        'A local-first app that tracks who you are overdue to call and helps you schedule and get reminded about calls.',
    longDescription:
        'Loop helps people keep in touch with the people they care about. Favorited contacts get a call frequency and priority, and the app works out who is overdue, surfaces "People to Call Today", schedules reminders, and logs activity. There is no backend and no account: an embedded Isar database is the single source of truth. Built solo over ~8 months.',
    tags: ['Isar', 'Riverpod', 'BLoC', 'Local-first'],
    color: const Color(0xFF1ABC9C),
    role:
        'Sole mobile developer — architecture, domain-logic design, feature implementation, UI/UX.',
    challenge:
        'Replacing elapsed-day reminders with calendar-anchored schedules (a chosen weekday, day of month, or both), including month-end clamping, a grace window that auto-rolls missed check-ins to their next occurrence, and backward compatibility for existing contacts.',
    highlights: [
      ProjectHighlight(
        title: 'Relationship state engine',
        description:
            'Pure, dependency-free functions turn a call frequency and last interaction into onTrack / approachingOverdue / overdue / neverContacted, re-run on every database change to drive the home-screen insights.',
      ),
      ProjectHighlight(
        title: 'Reactive local database',
        description:
            'Five Isar collections back live-query streams, so the UI updates the moment any write happens anywhere in the app, with no manual cache invalidation.',
      ),
      ProjectHighlight(
        title: 'Writes that cannot drift',
        description:
            'Repository managers return Either<Failure, T>. Scheduling a call writes to Isar and books the OS notification in the same call.',
      ),
      ProjectHighlight(
        title: 'Native calendar integration',
        description:
            'Opt-in one-way event export to the device calendar via device_calendar.',
      ),
    ],
    stack: [
      'Flutter & Dart',
      'Isar',
      'Riverpod + flutter_bloc',
      'dartz (Either)',
      'awesome_notifications',
      'device_calendar',
    ],
    githubUrl: 'https://github.com/TheNairaSign/Vivapro',
    repoNote: 'Repository name: vivapro',
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
  ProjectData(
    title: 'Airdesk',
    description:
        'Share text and files instantly with a short code, QR code, or link — no account required.',
    longDescription:
        'Airdesk is a cross-platform Flutter app for moving text and files between devices without signing up. Drop content onto a "desk", get a short code back, and anyone with the code — typed, scanned as a QR code, or opened as a link — can view and download it. "My Desk" adds a persistent named inbox that others can submit files to. Built solo since mid-2024 against a hosted REST backend.',
    tags: ['Riverpod', 'REST APIs', 'QR Codes', 'Share Target'],
    color: const Color(0xFF3498DB),
    role:
        'Sole mobile developer — app architecture, feature implementation, UI/UX, and backend API integration.',
    challenge:
        'Making every way of entering a code behave identically: one tested parser classifies view codes, edit codes, @desk names, and share URLs, so typed, QR-scanned, and linked entry all reach the same view and edit flows.',
    highlights: [
      ProjectHighlight(
        title: 'Diff-based share editing',
        description:
            'Editing a live share compares the original and current file sets and uploads only the change — removals by storage ID plus new files — in a single multipart request.',
      ),
      ProjectHighlight(
        title: 'Android share-sheet target',
        description:
            'Registered for text, images, video, and any file type (single and multiple), handling both cold-start and in-app share intents so content can be shared from any app into a new desk.',
      ),
      ProjectHighlight(
        title: 'Persistent named inboxes',
        description:
            'My Desk adds availability-checked custom names, a separate admin code for management, a submissions view, and locally cached codes that power autocomplete.',
      ),
      ProjectHighlight(
        title: 'Self-expiring local history',
        description:
            'Created shares are tracked for 24 hours by a self-cancelling periodic timer that prunes expired entries and drives live countdowns.',
      ),
    ],
    stack: [
      'Flutter & Dart',
      'Riverpod (StateNotifier)',
      'dartz (Either)',
      'http multipart + Dio',
      'qr_flutter + mobile_scanner',
      'flutter_sharing_intent',
    ],
    githubUrl: 'https://github.com/TheNairaSign/airdesk',
    screenshotsLight: ['assets/screenshots/airdesk/airdesk-dash-light.jpg'],
    screenshotsDark: ['assets/screenshots/airdesk/airdesk-dash-dark.jpg'],
  ),
  ProjectData(
    title: 'Cluttercut',
    description:
        'A duplicate-file cleaner that finds exact duplicates and removes them through a reversible recycle bin.',
    longDescription:
        'Cluttercut is an Android-focused Flutter utility for reclaiming storage. Scan the whole device or a folder, review groups of identical files, preview an original next to its duplicate, and remove the extras safely: removed files go to an in-app recycle bin and can be restored for 30 days.',
    tags: ['Riverpod', 'Hashing', 'File System'],
    color: const Color(0xFF8E44AD),
    role: 'Sole developer — design, implementation, and UI/UX.',
    challenge:
        'Avoiding hashing every file on a device: the scan groups files by byte size first and only computes MD5 checksums for files that share a size with another file, so files with a unique size are never read.',
    highlights: [
      ProjectHighlight(
        title: 'Verified, reversible deletion',
        description:
            'Files are copied to an app-private recycle bin and size-checked before the original is deleted, with rollback on mismatch. They can be restored for 30 days, then expire automatically.',
      ),
      ProjectHighlight(
        title: 'Failure-safe hashing',
        description:
            'Unreadable files are skipped, and a failed read returns a unique value instead of throwing, so an error can never be grouped as a false duplicate.',
      ),
      ProjectHighlight(
        title: 'UI-decoupled state',
        description:
            'Riverpod notifiers publish typed UI events (snackbars, confirmations) instead of touching BuildContext, keeping every destructive action behind an explicit confirm step.',
      ),
    ],
    stack: [
      'Flutter & Dart',
      'Riverpod (StateNotifier)',
      'crypto (MD5)',
      'file_picker + permission_handler',
      'video_player + chewie',
    ],
    githubUrl: 'https://github.com/TheNairaSign/clutter-cut',
    screenshotsLight: [
      'assets/screenshots/cluttercut/cc-dash-light.jpg',
      'assets/screenshots/cluttercut/cc-bin-light.jpg',
    ],
    screenshotsDark: [
      'assets/screenshots/cluttercut/cc-dash-dark.jpg',
      'assets/screenshots/cluttercut/cc-recycle-dark.jpg',
    ],
  ),
  ProjectData(
    title: 'Taskflow',
    description:
        'A team task manager with calendar and timeline scheduling, built in two days as a skills assessment.',
    longDescription:
        'Taskflow is a Flutter task-management app for small teams, built over two days as a mobile-developer skills assessment. It covers a dashboard, validated task creation and editing, a calendar with per-day task markers, a day timeline, and team-based filtering, with system light/dark themes. Data is mocked in memory, so the focus is UI and state handling rather than a backend.',
    tags: ['Provider', 'Calendar UI', 'Material 3'],
    color: const Color(0xFF9B59B6),
    role: 'Sole developer — two-day skills assessment.',
    stack: [
      'Flutter & Dart',
      'Provider',
      'table_calendar',
      'SharedPreferences',
      'Material 3 light/dark',
    ],
    githubUrl: 'https://github.com/TheNairaSign/taskflow',
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
];
