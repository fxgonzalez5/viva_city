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
      path: '/introduction',
      name: IntroductionScreen.name,
      builder: (context, state) => const IntroductionScreen(),
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

    GoRoute(
      path: '/category',
      name: CategoryScreen.name,
      builder: (context, state) => const CategoryScreen(),
    ),

    GoRoute(
      path: '/subcategory',
      name: SubCategoryScreen.name,
      builder: (context, state) => const SubCategoryScreen(),
    ),
    
    GoRoute(
      path: '/event',
      name: EventScreen.name,
      builder: (context, state) => const EventScreen(),
    ),
    
    GoRoute(
      path: '/place',
      name: PlaceScreen.name,
      builder: (context, state) => const PlaceScreen(),
    ),

    GoRoute(
      path: '/lodging',
      name: LodgingScreen.name,
      builder: (context, state) => const LodgingScreen(),
    ),

    GoRoute(
      path: '/loading',
      name: LoadingScreen.name,
      builder: (context, state) => const LoadingScreen(),
    ),

    GoRoute(
      path: '/map',
      name: MapScreen.name,
      builder: (context, state) => const MapScreen(),
    ),

    GoRoute(
      path: '/gps_access',
      name: GpsAccessScreen.name,
      builder: (context, state) => const GpsAccessScreen(),
    ),

    GoRoute(
      path: '/favorites',
      name: FavoritesScreen.name,
      builder: (context, state) => const FavoritesScreen(),
    ),
    
    GoRoute(
      path: '/profile',
      name: ProfileScreen.name,
      builder: (context, state) => const ProfileScreen(),
    ),
    
    GoRoute(
      path: '/edit_profile',
      name: EditProfileScreen.name,
      builder: (context, state) => const EditProfileScreen(),
    ),
  ],
);