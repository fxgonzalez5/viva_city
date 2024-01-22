import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:viva_city/config/theme/responsive.dart';

class CustomRatingBar extends StatelessWidget {
  final double? size;
  final double rating;
  
  const CustomRatingBar({
    super.key,
    this.size,
    required this.rating
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;

    return RatingBarIndicator(
      itemSize: size ?? responsive.ip(2.25),
      unratedColor: Colors.grey[400],
      rating: rating,
      itemBuilder: (context, index) => Icon(
          Icons.star,
          color: colors.secondary,
      ),
    );
  }
}