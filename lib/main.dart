import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:viva_city/config/router/app_router.dart';
import 'package:viva_city/config/theme/app_theme.dart';
import 'package:viva_city/presentation/providers/providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SlidesProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Viva City',
        routerConfig: appRouter,
        theme: AppTheme().getTheme(context),
      ),
    );
  }
}