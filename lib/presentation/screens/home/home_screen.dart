import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:viva_city/config/menu/category_items.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/screens/screens.dart';
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
              final images = List.generate(3, (i) => 'https://picsum.photos/id/${(i + 25) * (index + 1)}/1000');

              return CategoryCard(
                category: categoryItems[index].name,
                imageUrl: categoryItems[index].image,
                onTap: () => context.pushNamed(
                  CategoryScreen.name, 
                  extra: {
                    'index': index,
                    'images': images,
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

    final images = List.generate(5,
      (index) => FadeInImage(
        fit: BoxFit.cover,
        width: double.infinity, 
        placeholder: const AssetImage('assets/images/loading.gif'),
        image: NetworkImage('https://picsum.photos/id/${(index + 1) * 100}/1000'),
      )
    );

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          items: images,
          options: CarouselOptions(
            height: responsive.hp(35),
            viewportFraction: 1,
            scrollPhysics: const NeverScrollableScrollPhysics(),
            autoPlay: true,
            initialPage: homeProvider.currentSlider,
            onPageChanged: (int index, CarouselPageChangedReason reason) => homeProvider.currentSlider = index,
          )
        ),
        Container(
          height: responsive.hp(35),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54
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
          inactiveColor: const Color(0xffACACC9),
        )
      ],
    );
  }
}
