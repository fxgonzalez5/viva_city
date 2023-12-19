import 'package:go_router/go_router.dart';

import 'package:viva_city/presentation/screens/screens.dart';

//* GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: CheckAuthScreen.name,
      builder: (context, state) => const CheckAuthScreen(),
    ),

    GoRoute(
      path: '/slides',
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
      name: SignupScreen.name,
      builder: (context, state) => const SignupScreen(),
    ),

    GoRoute(
      path: '/sliding',
      name: SlidingScreen.name,
      builder: (context, state) => const SlidingScreen(),
    ),

    GoRoute(
      path: '/presentation',
      name: PresentationScreen.name,
      builder: (context, state) => const PresentationScreen(),
    ),
    
    GoRoute(
      path: '/navegation',
      name: NavegationScreen.name,
      builder: (context, state) => const NavegationScreen(),
    ),
    
    GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);