import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rating_bar_custom/rating_bar_custom.dart';
import 'package:viva_city/config/theme/custom_icons.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/screens/category/category_screen.dart';
import 'package:viva_city/presentation/widgets/custom_elevated_button.dart';
import 'package:viva_city/presentation/widgets/foot_of_description.dart';
import 'package:viva_city/presentation/widgets/head_of_description.dart';
import 'package:viva_city/presentation/widgets/shared/recommendation_list.dart';

class DescriptionCategoryLugares extends StatelessWidget {
  static const String name = 'description_category_lugares_screen'; 
  const DescriptionCategoryLugares({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra! as Map<dynamic, dynamic>;
    final texts = Theme.of(context).textTheme;
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeadOfDescription(),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: responsive.wp(6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingBarCustom(
                    numberStars: 5,
                    starCount: 2,
                    colorStar: Colors.orange),
                    SizedBox(height: responsive.hp(1),),
                  
                  SizedBox(height: responsive.hp(1),),
                  Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet'
                'dolore magna aliquam erat volutpat. Ut wisi enim Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh.', style: TextStyle(fontSize: responsive.ip(1.4)),)
                 ,
                 SizedBox(height: responsive.hp(1),), 
                 Text('Horarios de visita', style: TextStyle(color: colors.primary, fontSize: responsive.ip(1.4)),),
                 SizedBox(height: responsive.hp(0.5),), 
                 Text('Lorem ipsum dolor sit amet', style: TextStyle(fontSize: responsive.ip(1.4)),)
                ,SizedBox(height: responsive.hp(1.5),), 
                Text('Cómo llegar', style: TextStyle(color: colors.primary, fontSize: responsive.ip(1.4))),
                SizedBox(height: responsive.hp(0.5),),
                Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet'
                'dolore magna aliquam erat volutpat. Ut wisi enim Lorem ipsum dolor sit amet',style: TextStyle( fontSize: responsive.ip(1.4))),
                SizedBox(height: responsive.hp(3),),
                _Buttons()
                ],
              ),
            ),            
            FootOfDescription(),
          ],
        ),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomElevatedButton(text: 'Agregar a mi ruta', onPressed: (){}),
        Spacer(),
        TextButton.icon(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined), label: Text('Ir a galería'))
      ],
    );
  }
}

