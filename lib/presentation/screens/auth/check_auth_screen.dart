import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:viva_city/config/preferences/user_preferences.dart';
import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/services/services.dart';
import 'package:viva_city/presentation/screens/screens.dart';


class CheckAuthScreen extends StatelessWidget {
  static const String name = 'check_auth_screen';

  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuthService = FirebaseAuthService();
    final userProvider = context.read<ProfileProvider>();

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: firebaseAuthService.authStatus(),
        builder: (context, snapshot) {
          if (UserPreferences.firstTime) return const SlidesScreen();
          
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          
          if (snapshot.connectionState == ConnectionState.active){
            if (snapshot.hasData) {
              return FutureBuilder(
                future: firebaseAuthService.getUser(),
                initialData: null,
                builder: (context, snapshot) {
                  userProvider.user = snapshot.data;
                  return const NavegationScreen();
                },
              );
            }
          }
          
          return const LoginScreen();
        }, 
      )
   );
  }
}