import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:viva_city/config/menu/category_items.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/screens/screens.dart';
import 'package:viva_city/presentation/widgets/slider_card.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen'; 

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _CustomCarouselSlider(),
        Expanded(
          child: ListView.builder(
            itemCount: categoryItems.length,
            itemBuilder: (BuildContext context, int index) {
              final capitalizeTitle = categoryItems[index].category.substring(0,1) + categoryItems[index].category.substring(1).toLowerCase();
              final cards = List.generate(3, (i) => SliderCard(imageUrl: 'https://picsum.photos/id/${(i + 55) * (index + 1)}/1000'));
              final enlaces = List.generate(3, (i) => 'https://picsum.photos/id/${(i + 25) * (index + 1)}/1000');

              return CategoryCard(
                category: categoryItems[index].category,
                imageUrl: categoryItems[index].image,
                onTap: () => context.pushNamed(
                  categoryScreen.name, 
                  extra: {
                    'title': categoryItems[index].title,
                    'titleAppBar': capitalizeTitle,
                    'cards': cards,
                    'enlaces': enlaces,
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CustomCarouselSlider extends StatelessWidget {
  const _CustomCarouselSlider();

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;

    final images = List.generate(5, (index) => Image.network('https://picsum.photos/id/${(index + 1) * 100}/1000', width: double.infinity, fit: BoxFit.cover,));

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          items: images,
          options: CarouselOptions(
            height: responsive.hp(40),
            viewportFraction: 1,
            scrollPhysics: const NeverScrollableScrollPhysics(),
            autoPlay: true,
            onPageChanged: (int index, CarouselPageChangedReason reason) => homeProvider.currentSlider = index,
          )
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                const Color(0xff1D1D1B).withOpacity(0.75)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
          ),
        ),
        Dots(
          currentIndex: homeProvider.currentSlider,
          itemCount: images.length,
          activeColor: colors.secondary,
        )
      ],
    );
  }
}
