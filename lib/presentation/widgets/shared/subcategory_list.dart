import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class SubcategoryList extends StatelessWidget {
  final List<dynamic> items;
  final String? route;

  const SubcategoryList({
    super.key,
    required this.items, 
    this.route
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Expanded(
      child: ListView.separated(
        itemCount: items.length, 
        itemBuilder: (context, index) => _SubcategoryItem(
          image: items[index].portada,
          title: items[index].titulo,
          labels: items[index].getAttribute() is List<String> ? items[index].getAttribute() : null,
          score: items[index].getAttribute() is double ? items[index].getAttribute() : 0,
          hasRating: items[index].getAttribute() is List<String> ? false : true,
          location: items[index].ubicacion,
          description: items[index].descripcion,
          onTap: () => context.push(route!, extra: items[index]),
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


class _SubcategoryItem extends StatelessWidget {
  final String image;
  final String title;
  final List<String>? labels;
  final bool hasRating;
  final double score;
  final String location;
  final String description;
  final VoidCallback? onTap;

  const _SubcategoryItem({
    required this.image,
    required this.title,
    this.labels,
    this.hasRating = true,
    this.score = 0,
    required this.location,
    required this.description,
    this.onTap
  }): assert(hasRating ? score >= 0 : labels != null);



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
                image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)
              ),
              child: FavoriteButton(
                icon: Icons.favorite_border,
                iconColor: Colors.grey.shade400,
                onPressed: () {
                  // TODO: Asignar el evento a la lista de favoritos del usuario
                },
              ),
            ),
            SizedBox(width: responsive.wp(5)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  SizedBox(height: responsive.hp(0.5)),
                  if (hasRating)
                    CustomRatingBar(
                      size: responsive.ip(1.5),
                      rating: score
                    )
                  else
                    SizedBox(
                      height: responsive.hp(2),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          labels!.length,
                          (index) => CustomLabel(
                            text: labels![index],
                            style: texts.bodySmall!.copyWith(color: colors.secondary),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: responsive.hp(0.5)),
                  Text(location, style: texts.bodySmall!.copyWith(color: Colors.grey)),
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