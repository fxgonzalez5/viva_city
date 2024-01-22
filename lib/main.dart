import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:viva_city/config/firebase/firebase_options.dart';
import 'package:viva_city/config/preferences/app_preferences.dart';
import 'package:viva_city/config/providers/app_providers.dart';
import 'package:viva_city/config/router/app_router.dart';
import 'package:viva_city/config/theme/app_theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providerList,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Viva City',
        routerConfig: appRouter,
        theme: AppTheme().getTheme(context),
      ),
    );
  }
}