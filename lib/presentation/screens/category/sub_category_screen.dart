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
            const Expanded(
              child: TabBarView(
                children: [
                  _ListOfSubcategoryElements(),
                  Center(child: Text('Mapa')), // TODO: Construir la pantalla del mapa
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListOfSubcategoryElements extends StatelessWidget {
  const _ListOfSubcategoryElements();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return ListView.separated(
      itemCount: listItems.length, 
      itemBuilder: (context, index) => _CustomSubcategoryItem(
        image: listItems[index].image,
        title: listItems[index].title,
        type: listItems[index].type,
        location: listItems[index].location,
        distance: listItems[index].distance,
        description: listItems[index].description,
        onTap: () {
          // TODO: Implementar la navegación a la pantalla de detalle con su respectiva información
        },
      ),
      separatorBuilder: (context, index) => LineDivider(
        color: Colors.grey,
        height: 0.25,
        width: responsive.wp(93),
      ),
    );
  }
}

class _CustomSubcategoryItem extends StatelessWidget {
  final String image;
  final String title;
  final String type;
  final String location;
  final String distance;
  final String description;
  final VoidCallback? onTap;

  const _CustomSubcategoryItem({
    required this.image,
    required this.title,
    required this.type,
    required this.location,
    required this.distance,
    required this.description,
    this.onTap
  });



  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsive.hp(1.5), horizontal: responsive.wp(5)),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: responsive.wp(33),
              height: responsive.hp(13),
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)
              ),
            ),
            SizedBox(width: responsive.wp(5)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  SizedBox(height: responsive.hp(0.5)),
                  Row(
                    children: [
                      Text(type, style: texts.bodySmall!.copyWith(color: colors.secondary)),
                      Flexible(child: Text(' | $location', style: texts.bodySmall!.copyWith(color: Colors.grey), overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                  Text(distance, style: texts.bodySmall!.copyWith(color: Colors.grey)),
                  SizedBox(height: responsive.hp(0.5)),
                  Text(description, style: texts.bodySmall, maxLines: 3, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
