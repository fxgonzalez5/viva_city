import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viva_city/config/menu/items_of_subcategory.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/screens/screens.dart';
import 'package:viva_city/presentation/widgets/sub_card.dart';
class SubCategoryScreen extends StatelessWidget {
  static const String name = 'subcategory_screen'; 
  const SubCategoryScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra! as Map<String, dynamic>;
    final responsive = Responsive(context);
    
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: responsive.hp(6.8),
          title: Text(
            data["title"],
            style: TextStyle(
              fontSize: responsive.ip(1.6),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: responsive.hp(7),
              color: Colors.white,
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    icon: Icon(Icons.list, size: responsive.ip(3)),
                  ),
                  Tab(
                    icon: Icon(Icons.map_outlined, size: responsive.ip(3)),
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: ItemsOfSub.length, 
                    itemBuilder: (BuildContext context, int index) {
                      return SubCardItems(
                        image: ItemsOfSub[index].image,
                         category: ItemsOfSub[index].category, 
                         tipo: ItemsOfSub[index].tipo, 
                         ubi: ItemsOfSub[index].ubi, 
                         distance: ItemsOfSub[index].distance, 
                         description: ItemsOfSub[index].description,
                         onTap: ()=> context.pushNamed(DescriptionCategory.name, extra: {'title': ItemsOfSub[index].category}),
                        
                      );
                    },
                  ),
                  Container(
                    child: ListView.builder(itemCount: 1, itemBuilder:  
                    (BuildContext context, int index) {
                      return Container();
                    },),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
