import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:viva_city/config/menu/list_items.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class SubCategoryScreen extends StatelessWidget {
  static const String name = 'sub_category_screen'; 
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra! as Map<String, dynamic>;
    final responsive = Responsive(context);
    
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text(data["titleAppBar"])),
        body: Column(
          children: [
            TabBar.secondary(
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(icon: Icon(Icons.list, size: responsive.ip(3))),
                Tab(icon: Icon(Icons.map_outlined, size: responsive.ip(3)))
              ],
            ),
             Expanded(
              child: TabBarView(
                children: [
                  SubcategoryList(items: listItems, category: data['category'],),
                  const Center(child: Text('Mapa')), // TODO: Construir la pantalla del mapa
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}