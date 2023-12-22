import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:viva_city/config/menu/menu_items.dart';
import 'package:viva_city/config/menu/navigation_items.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/screens/screens.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class NavegationScreen extends StatelessWidget {
  static const String name = 'navegation_screen';

  const NavegationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      drawer: const _CustomDrawer(),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: const [
          HomeScreen(),
        ],
      ),
      bottomNavigationBar: const _CustomNavigationBar(),
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
                ...menuItems.getRange(0, 5).map(
                  (item) => _CustomListTile(item),
                ),
                const _CustomLineDivider(),
                ...menuItems.getRange(5, 7).map(
                  (item) => _CustomListTile(item),
                ),
                const _CustomLineDivider(),
                ...menuItems.getRange(7, menuItems.length).map(
                  (item) => _CustomListTile(item),
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

class _CustomListTile extends StatelessWidget {
  final MenuItem item;
  
  const _CustomListTile(this.item);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return ListTile(
      leading: SizedBox(
        width: responsive.wp(12),
        child: Icon(item.icon, color: Colors.black45),
      ),
      title: Text(item.label, style: const TextStyle(color: Colors.black45,)),
      style: ListTileStyle.drawer,
      onTap: () {
        // TODO: Implementar la naveación a las diferentes pantallas
      },
    );
  }
}

class _CustomDrawerHeader extends StatelessWidget {
  const _CustomDrawerHeader();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final responsive = Responsive(context);

    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: responsive.wp(3)),
      color: colors.secondary,
      child: Row(
        children: [
          Text('MENU', style: TextStyle(fontSize: responsive.ip(1.5), color: Colors.white,),),
          const Spacer(),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: const DecorationImage(image: NetworkImage('https://via.placeholder.com/100')),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: responsive.wp(0.5))
            ),
          )
        ],
      ),
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
      )),
      child: BottomNavigationBar(
        items: navegationItems,
        onTap: (int value) {},
      ),
    );
  }
}
