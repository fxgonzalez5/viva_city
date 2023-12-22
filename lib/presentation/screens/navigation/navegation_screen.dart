import 'package:flutter/material.dart';
import 'package:viva_city/config/menu/menu_items.dart';
import 'package:viva_city/config/menu/navigation_items.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/screens/screens.dart';
import 'package:viva_city/presentation/widgets/divider_menu.dart';
import 'package:viva_city/presentation/widgets/list_title_menu.dart';

class NavegationScreen extends StatelessWidget {
  static const String name = 'navegation_screen';

  const NavegationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final responsive = Responsive(context);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      drawer: Drawer(
          width: responsive.wp(80),
          child: ListView(
            children: [
              SizedBox(
                height: responsive.hp(6.5),
                child: DrawerHeader(
                  padding: EdgeInsets.all(responsive.ip(1.5)),
                  decoration: BoxDecoration(color: colors.secondary),
                  child: Row(children: [
                    Text(
                      "MENU",
                      style: TextStyle(
                          color: Colors.white, fontSize: responsive.ip(1.2)),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: responsive.ip(1.2),
                    ) // TODO: IMAGEN DE FOTO DE USUARIO (circleavatar)
                  ]),
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: menuItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTitles(
                    Texto: menuItems[index].category,
                    Images: menuItems[index].image,);
                },
              ),
        const MenuDivider(),
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: menuItems2.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTitles(
                Texto: menuItems2[index].category,
                Images: menuItems2[index].image,);
            }
        ),
        const MenuDivider(),
        ListTitles(Texto: "Ajustes", Images: "assets/images/ajustes_menu.png")
            ],
          )),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: const [HomeScreen()],
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
      )),
      child: BottomNavigationBar(
        items: navegationItems,
        onTap: (int value) {},
      ),
    );
  }
}
