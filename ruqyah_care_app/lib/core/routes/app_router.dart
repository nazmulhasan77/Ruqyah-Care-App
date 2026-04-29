// lib/core/routes/app_router.dart
import 'package:go_router/go_router.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/duas/duas_screen.dart';
import '../../screens/ruqyah_verses/verses_screen.dart';
import '../../screens/audio/audio_screen.dart';
import '../../screens/guide/guide_screen.dart';
import '../../screens/self_check/self_check_screen.dart';
import '../../screens/videos/videos_screen.dart';
import '../../screens/settings/settings_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (ctx, state) => const HomeScreen()),
    GoRoute(path: '/duas', builder: (ctx, state) => const DuasScreen()),
    GoRoute(path: '/verses', builder: (ctx, state) => const VersesScreen()),
    GoRoute(path: '/audio', builder: (ctx, state) => const AudioScreen()),
    GoRoute(path: '/guide', builder: (ctx, state) => const GuideScreen()),
    GoRoute(
      path: '/self-check',
      builder: (ctx, state) => const SelfCheckScreen(),
    ),
    GoRoute(path: '/videos', builder: (ctx, state) => const VideosScreen()),
    GoRoute(path: '/settings', builder: (ctx, state) => const SettingsScreen()),
  ],
);
