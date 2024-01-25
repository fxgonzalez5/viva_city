import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/screens/screens.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class SubCategoryScreen extends StatelessWidget {
  static const String name = 'sub_category_screen'; 
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra! as Map<String, dynamic>;
    final categoryProvider = context.watch<CategoryProvider>();
    final responsive = Responsive(context);
    
    return Scaffold(
      appBar: AppBar(title: Text(data["titleAppBar"])),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
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
                  SubcategoryList(items: categoryProvider.itemsSubcategory, route: data['route'],),
                  LoadingScreen(
                    data: [
                      {
                        'items': categoryProvider.itemsSubcategory,
                        'icon': 'assets/icons${data['route']}.png',
                      },
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}