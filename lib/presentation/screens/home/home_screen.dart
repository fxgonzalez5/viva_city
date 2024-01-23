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
              //eliminar, enviar en extras solo indx
              final images = List.generate(3, (i) => 'https://picsum.photos/id/${(i + 25) * (index + 1)}/1000');

              return CategoryCard(
                category: categoryItems[index].name,
                imageUrl: categoryItems[index].image,
                onTap: () => context.pushNamed(
                  CategoryScreen.name, 
                  extra: index
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
    final images = ['https://i0.wp.com/www.nlarenas.com/wp-content/uploads/guia-loja-villonaco-vilcabamba-puyango-bosque-cisne-23.jpg?fit=1200%2C772&ssl=1',
    'https://img.goraymi.com/2019/12/05/fa3a20825ae6dc6e53f07383200014bb_xl.jpg','https://i.pinimg.com/550x/cf/0a/72/cf0a7262eb2a3b5a1f4efc6af07215c6.jpg',
    'https://www.notyouraverageamerican.es/wp-content/uploads/2016/11/Loja-1-grande.jpg', 'https://hazteverecuador.com/wp-content/uploads/2016/11/independenciadeloja-18noviembre1820.webp'];


    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          items: List.generate(images.length,
      (index) => FadeInImage(
        fit: BoxFit.cover,
        width: double.infinity, 
        placeholder: const AssetImage('assets/images/loading.gif'),
        image: NetworkImage(images[index]),
      )
    ),
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
