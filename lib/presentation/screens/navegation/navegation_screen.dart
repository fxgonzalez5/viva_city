import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:viva_city/config/menu/menu_items.dart';
import 'package:viva_city/config/menu/navigation_items.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/services/services.dart';
import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/screens/screens.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class NavegationScreen extends StatelessWidget {
  static const String name = 'navegation_screen';

  const NavegationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuthService = FirebaseAuthService();
    final navegationProvider = context.read<NavegationProvider>();
    final profileProvider = context.read<ProfileProvider>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await firebaseAuthService.logout();
              profileProvider.expanded.clear();
              context.pushReplacementNamed(LoginScreen.name);
              navegationProvider.currentPage = 0;
            },
          )
        ],
      ),
      drawer: const _CustomDrawer(),
      body: PageView(
        controller: navegationProvider.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          SizedBox(),
          Center(child: Text('Mapa')),
          FavoritesScreen(),
          ProfileScreen()
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
    final navegationProvider = context.watch<NavegationProvider>();
    final profileProvider = context.read<ProfileProvider>();

    return Container(
      clipBehavior: Clip.hardEdge,
      height: responsive.hp(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(responsive.ip(3)),
          topRight: Radius.circular(responsive.ip(3)),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: navegationProvider.currentPage,
        items: navegationItems,
        onTap: (int value) {
          if (navegationProvider.currentPage == 4 && value != 4)  profileProvider.expanded.clear(); 
          if (value != 1) navegationProvider.currentPage =  value;
        },
      ),
    );
  }
}

class _CustomDrawer extends StatelessWidget {
  const _CustomDrawer();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final responsive = Responsive(context);

    return Drawer(
      width: responsive.wp(75),
      backgroundColor: colors.background,
      child: Column(
        children: [   
          const _CustomDrawerHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: responsive.hp(1)),
              physics: const BouncingScrollPhysics(),
              children: [
                ...menuItems.sublist(0, 5).map(
                  (item) => CustomListTile(
                    paddingLeading: EdgeInsets.only(left: responsive.wp(6), right: responsive.wp(4)),
                    icon: item.icon,
                    label: item.label,
                  ),
                ),
                const _CustomLineDivider(),
                ...menuItems.sublist(5, 7).map(
                  (item) => CustomListTile(
                    paddingLeading: EdgeInsets.only(left: responsive.wp(6), right: responsive.wp(4)),
                    icon: item.icon,
                    label: item.label,
                  ),
                ),
                const _CustomLineDivider(),
                ...menuItems.sublist(7, menuItems.length).map(
                  (item) => CustomListTile(
                    paddingLeading: EdgeInsets.only(left: responsive.wp(6), right: responsive.wp(4)),
                    icon: item.icon,
                    label: item.label,
                  ),
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}

class _CustomLineDivider extends StatelessWidget {
  const _CustomLineDivider();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return LineDivider(
      height: 0.5,
      start: responsive.wp(12),
      end: responsive.wp(20),
      space: responsive.hp(3),
    );
  }
}

class _CustomDrawerHeader extends StatelessWidget {
  const _CustomDrawerHeader();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final responsive = Responsive(context);
    final profileProvider = context.read<ProfileProvider>();

    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      backgroundColor: colors.secondary,
      title: const Text('MENU'),
      actions: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {  
            return CustomCircleAvatar(
              imagePath: profileProvider.user!.photoUrl,
              radius: constraints.maxHeight,
              margin: EdgeInsets.symmetric(vertical: responsive.hp(0.5), horizontal: responsive.wp(3.5)),
              strokeColor: Colors.white,
              strokeWidth: responsive.wp(0.5),
            );
          },
        ),
      ],
    ); 
  }
}
