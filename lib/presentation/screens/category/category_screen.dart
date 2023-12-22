import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:viva_city/config/menu/eventos_items.dart';
import 'package:viva_city/config/menu/sliders_cards.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/providers/home_provider.dart';
import 'package:viva_city/presentation/screens/subCategory/sub_category_screen.dart';
import 'package:viva_city/presentation/widgets/category_card.dart';
import 'package:viva_city/presentation/widgets/custom_slider_card.dart';
import 'package:viva_city/presentation/widgets/dots.dart';

class categoryScreen extends StatelessWidget {
  static const String name = 'category_screen';
  const categoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    final data = GoRouterState.of(context).extra! as Map<String,dynamic>;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: responsive.hp(6.8) ,
        title: Text(data["titleBAR"], style: TextStyle(
          fontSize: responsive.ip(1.6),
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        // leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back),
        // padding: EdgeInsets.only(left: responsive.wp(5)),
        // style: ButtonStyle(
        //   iconSize: MaterialStatePropertyAll(responsive.ip(3))
        // ) ,),
      ),
      body: 
      Column(
        children: [
          TextCategory(),
          SizedBox(height: responsive.hp(1.5),),
          Expanded(
          child: ListView.builder(
            itemCount: eventoItems.length,
            itemBuilder: (BuildContext context, int index) {
              return CategoryCard(
                category: eventoItems[index].category,
                imageUrl: eventoItems[index].image,
                onTap: ()=> context.pushNamed(SubCategoryScreen.name, extra:  {'title': eventoItems[index].category}),
                );
            },
          ),
        ),
        ],
      ),
    );
  }
}

class TextCategory extends StatelessWidget {
  const TextCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra! as Map<String,dynamic>;
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: responsive.wp(7), top: responsive.hp(2)),
          child: Text(data["title"], style: TextStyle(
            fontSize: responsive.ip(2.16),
            color: colors.primary,
          ),),
        ),
        SizedBox(
          height: responsive.hp(2.5),
        ),
        Slider()
      ],
    );
  }
}

class Slider extends StatelessWidget {
  const Slider();



  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
  
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: responsive.wp(100),
          height: responsive.hp(30),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [ BoxShadow(
                color: Colors.black12,
                blurRadius: responsive.ip(0.1),
                
              )],
          ),
          child: CarouselSlider.builder(itemCount: sliderEvItems.length, itemBuilder: (BuildContext context, int index, int PageViewindex ) {
              return sliderCard(
                image: sliderEvItems[index].image,);
            }, options: CarouselOptions(
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            viewportFraction: 0.5,
            scrollPhysics: const NeverScrollableScrollPhysics(),
            autoPlay: true,
            onPageChanged: (int index, CarouselPageChangedReason reason) => homeProvider.currentSlider = index,
          )),
        ),
          Dots(
                currentIndex: homeProvider.currentSlider,
                itemCount: sliderEvItems.length,
                activeColor: colors.primary,
              )
      ],
    );
  }
}

