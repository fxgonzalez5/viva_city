import 'package:go_router/go_router.dart';

import 'package:viva_city/presentation/screens/screens.dart';

//* GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: SlidesScreen.name,
      builder: (context, state) => const SlidesScreen(),
    ),

    GoRoute(
      path: '/login',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: '/signup',
      name: SigupScreen.name,
      builder: (context, state) => const SigupScreen(),
    ),
  ],
);