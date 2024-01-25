import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/providers/category_provider.dart';
import 'package:viva_city/presentation/providers/profile_provider.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class SubcategoryList extends StatelessWidget {
  final List<dynamic> items;
  final bool isFavorites;
  final String? route;

  const SubcategoryList({
    super.key,
    required this.items,
    this.isFavorites = false,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return ListView.separated(
      itemCount: items.length, 
      itemBuilder: (context, index) => _SubcategoryItem(
        object: items[index],
        isFavorites: isFavorites,
        onTap: () {
          context.read<CategoryProvider>().currentObject = items[index];
          context.push(route!, extra: items[index]);
        }
      ),
      separatorBuilder: (context, index) => LineDivider(
        color: Colors.grey,
        height: 0.25,
        width: responsive.wp(93),
      ),
    );
  }
}

class _SubcategoryItem extends StatelessWidget {
  final dynamic object;
  final bool isFavorites;
  final VoidCallback? onTap;

  const _SubcategoryItem({
    required this.object,
    required this.isFavorites,
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
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(object.portada), fit: BoxFit.cover)
              ),
              child: FavoriteButton(
                icon: (object.isFavorite) ? Icons.favorite : Icons.favorite_border,
                iconColor: (object.isFavorite) ? Colors.red : Colors.grey.shade400,
                onPressed: () {
                  if (object.isFavorite) {
                    context.read<ProfileProvider>().removeFavorites(object);
                  } else {
                    context.read<ProfileProvider>().addFavorites(object);
                  }
                  object.isFavorite = !object.isFavorite;
                  if (!isFavorites) context.read<CategoryProvider>().updateItemByCategory(2, object);
                },
              ),
            ),
            SizedBox(width: responsive.wp(5)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(object.titulo),
                  SizedBox(height: responsive.hp(0.5)),
                  if (object.getAttribute() is List<String> ? false : true)
                    CustomRatingBar(
                      size: responsive.ip(1.5),
                      rating: object.getAttribute(),
                    )
                  else
                    SizedBox(
                      height: responsive.hp(2),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          object.getAttribute().length,
                          (index) => CustomLabel(
                            text: object.getAttribute()[index],
                            style: texts.bodySmall!.copyWith(color: colors.secondary),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: responsive.hp(0.5)),
                  Text(object.ubicacion, style: texts.bodySmall!.copyWith(color: Colors.grey)),
                  SizedBox(height: responsive.hp(0.5)),
                  Text(object.descripcion, style: texts.bodySmall, maxLines: 3, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}