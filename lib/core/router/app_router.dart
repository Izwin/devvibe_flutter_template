import 'package:devvibe_template/features/auth/presentation/auth_page.dart';
import 'package:devvibe_template/features/home/home_page.dart';
import 'package:devvibe_template/splash_page.dart';
import 'package:go_router/go_router.dart';

var router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (_, __) => const SplashPage()),
    GoRoute(path: '/auth', builder: (_, __) => const AuthPage()),
    GoRoute(path: '/home', builder: (_, __) => const HomePage()),
  ],
);
