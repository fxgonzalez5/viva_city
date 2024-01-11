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

class DescriptionCategoryHoteles extends StatelessWidget {
  static const String name = 'description_category_hoteles_screen'; 
  const DescriptionCategoryHoteles({super.key});

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
                  Text('Ubicación:Centro Histórico\nAeropuerto: a 45 minutos (Catamayo)\nDirección: Colón y 18 de Noviembre\nTeléfono: (593 7) 258 3500\n'
                  'Celular: (593 7) 258 3500\nE-mail:reservas@hotelcarrionloja.com\nWeb:www.hotelcarrionloja.com', style: TextStyle(color: colors.primary, fontSize: responsive.ip(1.3)),),
                  SizedBox(height: responsive.hp(1),),
                  Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet'
                'dolore magna aliquam erat volutpat. Ut wisi enim Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh.', style: TextStyle(fontSize: responsive.ip(1.4)),)
                 ,
                 SizedBox(height: responsive.hp(1),), 
                 Text('Servicios / Facilidades', style: TextStyle(color: colors.primary, fontSize: responsive.ip(1.4)),),
                 SizedBox(height: responsive.hp(0.5),), 
                 Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet'
                'dolore magna aliquam erat volutpat. Ut wisi enim Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh.', style: TextStyle(fontSize: responsive.ip(1.4)),)
                ,SizedBox(height: responsive.hp(1.5),), 
                Text('Conoce dónde te vas a quedar', style: TextStyle(color: colors.primary, fontSize: responsive.ip(1.4))),
                SizedBox(height: responsive.hp(0.5),),
                Text('Este es nuestro hotel, cómodo y confortable.',style: TextStyle( fontSize: responsive.ip(1.4))),
                SizedBox(height: responsive.hp(3),),
                _Images(),
                SizedBox(height: responsive.hp(2),),
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

class _Images extends StatelessWidget {
  const _Images({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Column(
      children: [
        Row(
          children: [
        _images(),
        SizedBox(width: responsive.wp(2),),
        _images(),
        SizedBox(width: responsive.wp(2),),
        _images()
        
          ],
        ),
        SizedBox(height: responsive.hp(2),),
        Row(
          children: [
        _images(),
        SizedBox(width: responsive.wp(2),),
        _images(),
        SizedBox(width: responsive.wp(2),),
        _images()
        
          ],
        ),
      ],
    );
  }
}

class _images extends StatelessWidget {
  
  const _images({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      height: responsive.hp(8),
      width: responsive.wp(28),
      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://picsum.photos/seed/picsum/200/300'), fit: BoxFit.cover),
      )
    );
  }
}
