import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viva_city/config/menu/list_items.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/providers/category_provider.dart';
import 'package:viva_city/presentation/widgets/dots.dart';

class CustomCarouselSlider extends StatelessWidget {
  
  const CustomCarouselSlider();

  @override
  Widget build(BuildContext context) {
    final categoryProvider = context.watch<CategoryProvider>();
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    
    return Container(
      width: double.infinity,
      height: responsive.hp(31),
      padding: EdgeInsets.only(top: responsive.hp(2.5)),
      child: Column(
        children: [
          CarouselSlider(
            items: List.generate(listItems.length, (index) => _SliderCard(imageUrl: listItems[index].image)),
            options: CarouselOptions(
              height: responsive.hp(23),
              viewportFraction: 0.55,
              autoPlay: false,
              enlargeCenterPage: true,
              initialPage: categoryProvider.currentSlider,
              onPageChanged: (int index, CarouselPageChangedReason reason) => categoryProvider.currentSlider = index,
            )
          ),
        ],
      ),
    );
  }
}

class _SliderCard extends StatelessWidget {
  final String imageUrl;
  
  const _SliderCard({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsive.wp(2)),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(responsive.ip(1))),
      ),
      child: Stack(
        children: [
          FadeInImage(
            fit: BoxFit.cover,
            width: double.infinity,
            placeholder: const AssetImage('assets/images/loading.gif'),
            image: NetworkImage(imageUrl),
          ),
        ],
      ),
    );
  }
}