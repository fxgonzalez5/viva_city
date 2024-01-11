import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:viva_city/config/menu/list_items.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/screens/screens.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class CategoryScreen extends StatelessWidget {
  static const String name = 'category_screen';
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra! as Map<String, dynamic>;
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    const subCategorys = ['Teatro', 'Caminatas', 'Presentaciones'];

    return Scaffold(
      appBar: AppBar(
        title: Text(data["titleAppBar"]),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(1.5), horizontal: responsive.wp(8)),
            child: Text(data["title"], style: texts.headlineSmall),
          ),
          const _CustomCarouselSlider(),
          Expanded(
            child: ListView.builder(
              itemCount: subCategorys.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard(
                  category: subCategorys[index].toUpperCase(),
                  imageUrl: data['subCategory'][index],
                  onTap: () => context.pushNamed(SubCategoryScreen.name, extra:  {'titleAppBar': subCategorys[index].toUpperCase(), 'category': data["titleAppBar"]}),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomCarouselSlider extends StatelessWidget {
  
  const _CustomCarouselSlider();

  @override
  Widget build(BuildContext context) {
    final categoryProvider = context.watch<CategoryProvider>();
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    
    return Container(
      width: double.infinity,
      height: responsive.hp(31),
      padding: EdgeInsets.only(top: responsive.hp(2.5)),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [ 
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1,
          )
        ],
      ),

      child: Column(
        children: [
          CarouselSlider(
            items: List.generate(listItems.length, (index) => _SliderCard(imageUrl: listItems[index].image)),
            options: CarouselOptions(
              height: responsive.hp(23),
              viewportFraction: 0.55,
              autoPlay: true,
              enlargeCenterPage: true,
              initialPage: categoryProvider.currentSlider,
              onPageChanged: (int index, CarouselPageChangedReason reason) => categoryProvider.currentSlider = index,
            )
          ),
          Dots(
            currentIndex: categoryProvider.currentSlider,
            itemCount: listItems.length,
            activeColor: colors.secondary,
            height: 40,
            inactiveSize: responsive.ip(1),
            inactiveColor: const Color(0xffACACC9),
          )
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
