import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:viva_city/config/menu/navigation_items.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/domain/services/services.dart';
import 'package:viva_city/presentation/screens/screens.dart';


class NavegationScreen extends StatelessWidget {
  static const String name = 'navegation_screen';

  const NavegationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuthService = FirebaseAuthService();

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await firebaseAuthService.logout();
              context.pushReplacementNamed(LoginScreen.name); 
            },
          )
        ],
      ),
      drawer: const Drawer(),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: const [
          HomeScreen()
        ],
      ),
      bottomNavigationBar: const _CustomNavigationBar(),
    );
  }
}

class _CustomNavigationBar extends StatelessWidget {
  const _CustomNavigationBar();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Container(
      clipBehavior: Clip.hardEdge,
      height: responsive.hp(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(responsive.ip(3)),
          topRight: Radius.circular(responsive.ip(3)),
        )
      ),
      child: BottomNavigationBar(
        items: navegationItems,
        onTap: (int value) {},
      ),
    );
  }
}