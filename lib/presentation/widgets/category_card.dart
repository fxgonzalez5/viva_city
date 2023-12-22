import 'package:flutter/material.dart';

import 'package:viva_city/config/theme/responsive.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  final String imageUrl;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(responsive.wp(2.5)),
        height: responsive.hp(15),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(responsive.ip(1.5))
        ),
        child: Stack(
          children: [
            !imageUrl.startsWith('http') 
            ? Image.asset(imageUrl, width: double.infinity, height: double.infinity, fit: BoxFit.cover,)
            : Image.network(imageUrl, width: double.infinity, height: double.infinity, fit: BoxFit.cover,),
            
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(responsive.wp(1.5)),
                width: responsive.wp(30),
                height: responsive.hp(3.5),
                color: colors.primary,
                child: Text(category, style: const TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}