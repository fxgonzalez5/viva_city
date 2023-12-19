import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:viva_city/config/preferences/user_preferences.dart';
import 'package:viva_city/domain/services/services.dart';
import 'package:viva_city/presentation/screens/screens.dart';


class CheckAuthScreen extends StatelessWidget {
  static const String name = 'check_auth_screen';

  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuthService = FirebaseAuthService();

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: firebaseAuthService.authStatus(),
        builder: (context, snapshot) {
          if (UserPreferences.firstTime) return const SlidesScreen();
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          
          if (snapshot.connectionState == ConnectionState.active){
            if (snapshot.hasData) return const NavegationScreen();
          }
          
          return const LoginScreen();
        }, 
      )
   );
  }
}