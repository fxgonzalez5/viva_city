
import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  final String imageUrl;
  const CategoryCard({
    super.key, required this.category, required this.imageUrl,

  });


  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.all(responsive.wp(2.5)),
      height: responsive.hp(15),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageUrl),
        fit: BoxFit.cover ),
        borderRadius: BorderRadius.circular(responsive.ip(1.5))
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          padding: EdgeInsets.all(responsive.wp(1.5)),
          width: responsive.wp(30),
          height: responsive.hp(3.5),
          color: colors.primary,
          child: Text(category, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}