import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:viva_city/config/helpers/text_formart.dart';
import 'package:viva_city/config/menu/category_items.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/screens/screens.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class CategoryScreen extends StatelessWidget {
  static const String name = 'category_screen';
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final index = GoRouterState.of(context).extra! as int;
    final categoryProvider = context.watch<CategoryProvider>();
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    final categoryItem = categoryItems[index];

    return PopScope(
      onPopInvoked: (value) => context.read<MapProvider>().markers.clear(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(TextFormat.capitalize(categoryItem.name)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: responsive.hp(1.5), horizontal: responsive.wp(8)),
              child: Text(categoryItem.title, style: texts.headlineSmall),
            ),
            _CustomCarouselSlider(categoryProvider.onDisplayData, categoryItem.route),
            Expanded(
              child: ListView.builder(
                itemCount: categoryItem.subcategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryCard(
                    category: categoryItem.subcategories[index].name,
                    imageUrl: categoryItem.subcategories[index].image,
                    onTap: () {
                      context.read<MapProvider>().markers.clear();
                      categoryProvider.getItemsBySubcategory(category: TextFormat.capitalize(categoryItem.name), subcategory: categoryItem.subcategories[index].name.toLowerCase());
                      context.pushNamed(
                        SubCategoryScreen.name,
                        extra:  {
                          'titleAppBar': TextFormat.capitalize(categoryItem.subcategories[index].name),
                          'route': categoryItem.route,
                        }
                      );
                    } 
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomCarouselSlider extends StatelessWidget {
  final List<dynamic> carouselItems;
  final String? route;
  
  const _CustomCarouselSlider(this.carouselItems, this.route);

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
            items: List.generate(
              carouselItems.length,
              (index) => _SliderCard(
                object: carouselItems[index],
                onTap: () {
                  context.read<CategoryProvider>().currentObject = carouselItems[index];
                  context.push(route!, extra: carouselItems[index]);
                }
              ),
            ),
            options: CarouselOptions(
              enableInfiniteScroll: carouselItems.length > 1,
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
            itemCount: carouselItems.length,
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
  final dynamic object;
  final VoidCallback? onTap;
  
  const _SliderCard({
    required this.object,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              height: double.infinity,
              placeholder: const AssetImage('assets/images/loading.gif'),
              image: NetworkImage(object.portada),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black],
                  stops: [0.4, 1]
                )
              ),
            ),
      
            if (object.getAttribute() is List<String>)
              _CardCloseup(
                title: object.titulo,
                items: object.etiquetas,
                hasRating: false,
                object: object,
              )
            else
              _CardCloseup(
                title: object.titulo,
                score: object.calificacion,
                object: object,
              ),
          ],
        ),
      ),
    );
  }
}

class _CardCloseup extends StatelessWidget {
  final String title;
  final List<String>? items;
  final bool hasRating;
  final double score;
  final dynamic object;

  const _CardCloseup({
    required this.title,
    this.items,
    this.hasRating = true,
    this.score = 0,
    required this.object,
  }): assert(hasRating ? score >= 0 : items != null);


  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.all(responsive.wp(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: FavoriteButton(
              icon: (object.isFavorite) ? Icons.favorite : Icons.favorite_border,
              iconColor: (object.isFavorite) ? Colors.red : Colors.grey.shade400,
              onPressed: () {
                if (object.isFavorite) {
                  context.read<ProfileProvider>().favorites.remove(object);
                } else {
                  context.read<ProfileProvider>().favorites.add(object);
                }
                object.isFavorite = !object.isFavorite;
                context.read<CategoryProvider>().updateItemByCategory(1, object);
              },
            ),
          ),
          const Spacer(),
          Text(title, style: texts.titleLarge!.copyWith(color: Colors.white), maxLines: 2, overflow: TextOverflow.ellipsis,),
          SizedBox(height: responsive.hp(0.5)),
          if (hasRating)
            CustomRatingBar(
              size: responsive.ip(1.7),
              rating: score
            )
          else
            SizedBox(
              height: responsive.hp(2.5),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: List.generate(items!.length, (index) => Center(child: CustomLabel(text: items![index]))),
              ),
            ),
        ],
      ),
    );
  }
}