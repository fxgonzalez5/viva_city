import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';

class SliderCard extends StatelessWidget {
  final String imageUrl;
  
  const SliderCard({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsive.wp(2)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(responsive.ip(1))),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover
        )
      ),
    );
  }
}