import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';

class sliderCard extends StatelessWidget {
  final String image;
  const sliderCard({
    super.key, required this.image,
  });



  @override
  Widget build(BuildContext context) {
     final responsive = Responsive(context);
    return Column(
      children: [
        SizedBox(height: responsive.hp(2)),
        Container(
          margin: EdgeInsets.symmetric(horizontal: responsive.wp(4)),
        width: responsive.wp(40),
        height: responsive.hp(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(responsive.ip(1))),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)
        ),
      ),
      ],
    );
  }
}