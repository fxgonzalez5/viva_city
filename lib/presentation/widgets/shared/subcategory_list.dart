import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class SubcategoryList extends StatelessWidget {
  final List<dynamic> items;

  const SubcategoryList({
    super.key,
    required this.items
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Expanded(
      child: ListView.separated(
        itemCount: items.length, 
        itemBuilder: (context, index) => SubcategoryItem(
          image: items[index].image,
          title: items[index].title,
          type: items[index].type,
          location: items[index].location,
          distance: items[index].distance,
          description: items[index].description,
          onTap: () {
            // TODO: Implementar la navegación a la pantalla de detalle con su respectiva información
          },
        ),
        separatorBuilder: (context, index) => LineDivider(
          color: Colors.grey,
          height: 0.25,
          width: responsive.wp(93),
        ),
      ),
    );
  }
}


class SubcategoryItem extends StatelessWidget {
  final String image;
  final String title;
  final String type;
  final String location;
  final String distance;
  final String description;
  final VoidCallback? onTap;

  const SubcategoryItem({
    super.key, 
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