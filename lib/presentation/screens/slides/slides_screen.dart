import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:viva_city/config/menu/slider_items.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/screens/screens.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';


class SlidesScreen extends StatelessWidget {
  static const String name = 'slides_screen';

  const SlidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final slidesProvider = context.read<SlidesProvider>();

    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: slidesProvider.pageController,
        itemCount: sliderItems.length,
        itemBuilder: (context, index) => _CustomSlide(
          index: slidesProvider.currentPage,
          image: sliderItems[index].image,
          emphasis: sliderItems[index].emphasis,
          description: sliderItems[index].description,
          onPressed: () {
            if (slidesProvider.currentPage < sliderItems.length - 1){
              slidesProvider.currentPage++;
            } else {
              context.pushReplacementNamed(LoginScreen.name);
            }
          },
        )
      ),
   );
  }
}

class _CustomSlide extends StatelessWidget {
  final int index;
  final String image;
  final String emphasis;
  final String description;
  final VoidCallback onPressed;

  const _CustomSlide({
    required this.index,
    required this.image,
    required this.emphasis,
    required this.description,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Image.asset(image, width: double.infinity, fit: BoxFit.cover,),
        const _DarkEffect(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _EmphasizedText(text: emphasis),
              SizedBox(height: responsive.hp(2)),
              _DescriptionText(text: description),
              SizedBox(height: responsive.hp(3)),
              ElevatedButton(
                onPressed: onPressed,
                child: Text(index < sliderItems.length - 1 ? 'Siguiente' : 'Comenzar'),
              ),
              Dots(
                height: responsive.hp(7.5),
                currentIndex: index,
                itemCount: sliderItems.length,
                activeColor: colors.secondary,
                inactiveColor: const Color(0xffACACC9),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _DescriptionText extends StatelessWidget {
  final String text;
  
  const _DescriptionText({
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return SizedBox(
      width: responsive.wp(80),
      child: Text(
        text,
        style: TextStyle(
          fontSize: responsive.ip(1.5),
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _EmphasizedText extends StatelessWidget {
  final String text;
  
  const _EmphasizedText({
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: responsive.wp(45),
      child: Text(
        text,
        style: TextStyle(
          fontSize: responsive.ip(1.5),
          color: colors.secondary,
          height: 2
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _DarkEffect extends StatelessWidget {
  const _DarkEffect();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xC4000000).withOpacity(0.6),
            const Color(0xff000000).withOpacity(0.8),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [
            0.2,
            0.9
          ]
        )
      ),
    );
  }
}