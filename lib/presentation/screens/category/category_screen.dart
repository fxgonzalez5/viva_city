import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:viva_city/config/menu/eventos_items.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/providers/home_provider.dart';
import 'package:viva_city/presentation/screens/subCategory/sub_category_screen.dart';
import 'package:viva_city/presentation/widgets/category_card.dart';
import 'package:viva_city/presentation/widgets/slider_card.dart';
import 'package:viva_city/presentation/widgets/dots.dart';

class categoryScreen extends StatelessWidget {
  static const String name = 'category_screen';
  const categoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra! as Map<String, dynamic>;
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(data["titleAppBar"]),
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2), horizontal: responsive.wp(8)),
            child: Text(data["title"], style: TextStyle(fontSize: responsive.ip(2.16), color: colors.primary)),
          ),
          _CustomCarouselSlider(data["cards"]),
          Expanded(
            child: ListView.builder(
              itemCount: eventoItems.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard(
                  category: eventoItems[index].category,
                  imageUrl: data['enlaces'][index],
                  onTap: () => context.pushNamed(SubCategoryScreen.name, extra:  {'title': eventoItems[index].category}),
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
  final List<Widget> cards;
  
  const _CustomCarouselSlider(this.cards);

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    
    return Container(
      width: double.infinity,
      height: responsive.hp(32.5),
      padding: EdgeInsets.only(top: responsive.hp(3), bottom: responsive.hp(1)),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [ 
          BoxShadow(
            color: Colors.black26,
            blurRadius: 1,
          )
        ],
      ),
      
      child: Column(
        children: [
          CarouselSlider(
            items: cards,
            options: CarouselOptions(
              height: responsive.hp(23),
              viewportFraction: 0.5,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (int index, CarouselPageChangedReason reason) => homeProvider.currentSlider = index,
            )
          ),
          const Spacer(),
          Dots(
            currentIndex: homeProvider.currentSlider,
            itemCount: cards.length,
            activeColor: colors.primary,
          )
        ],
      ),
    );
  }
}
