import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viva_city/config/theme/custom_icons.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/screens/category/category_screen.dart';
import 'package:viva_city/presentation/widgets/carrusel.dart';
import 'package:viva_city/presentation/widgets/custom_elevated_button.dart';
import 'package:viva_city/presentation/widgets/foot_of_description.dart';
import 'package:viva_city/presentation/widgets/head_of_description.dart';
import 'package:viva_city/presentation/widgets/shared/recommendation_list.dart';

class DescriptionCategoryEventos extends StatelessWidget {
  static const String name = 'description_category_eventos_screen'; 
  const DescriptionCategoryEventos({super.key});

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
            _AllEtiquetas(),
            Padding(padding:EdgeInsetsDirectional.only(start: responsive.wp(6), top: responsive.hp(3), end: responsive.wp(6)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet'
                'dolore magna aliquam erat volutpat. Ut wisi enim Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh.', 
                style: TextStyle(fontSize: responsive.ip(1.4)) ),
                TextButton( onPressed: (){} , child: Text('+ Invitar amigos', style: TextStyle(color: colors.primary, fontSize: responsive.ip(1.16)),) )
              ],
            ),),
            CustomCarouselSlider(),
            _containerInfo(),
            FootOfDescription(),
          ],
        ),
      ),
    );
  }
}

class _containerInfo extends StatelessWidget {
  const _containerInfo({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
        final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.only(left: responsive.wp(6), top: responsive.hp(3)),
      width: responsive.wp(90),
      height: responsive.hp(30),
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(responsive.ip(2))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Lugar: Lorem ipsum dolor sit amet', style: TextStyle(color: colors.primary, fontSize: responsive.ip(1.4)),),
        SizedBox(height: responsive.hp(1),),
          Text('Hora: Lorem ipsum dolor sit amet', style: TextStyle(color: colors.primary, fontSize: responsive.ip(1.4)),),
         SizedBox(height: responsive.hp(1),),
          Text('Público: Lorem ipsum dolor sit amet', style: TextStyle(color: colors.primary, fontSize: responsive.ip(1.4)),),
          SizedBox(height: responsive.hp(1),),
          Text('Organizador: Lorem ipsum dolor sit amet', style: TextStyle(color: colors.primary, fontSize: responsive.ip(1.4)),),
          SizedBox(height: responsive.hp(1),),
          Text('Valor: Entrada Libre hasta llenar aforo', style: TextStyle(color: colors.primary, fontSize: responsive.ip(1.4)),),
          SizedBox(height: responsive.hp(1),),
          Text('Cómo llegar?: Lorem ipsum dolor sit amet', style: TextStyle(color: colors.primary, fontSize: responsive.ip(1.4)),),
          SizedBox(height: responsive.hp(1.5),), 
          Align(
            alignment: Alignment.center,
          child: 
          CustomElevatedButton(text: 'COMPRAR TICKETS', onPressed: (){})
          )
        ],
      ),
    );
  }
}

class _AllEtiquetas extends StatelessWidget {
  const _AllEtiquetas({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: responsive.wp(6)),
      child: const Row(
        children: [
          _Etiquetas(title: 'música',),
          _Etiquetas(title: 'concierto',),
          _Etiquetas(title: 'Loja',),
          _Etiquetas(title: 'eventos',)
        ],
      ),
    );
  }
}

class _Etiquetas extends StatelessWidget {
    final String title;
  const _Etiquetas({
    super.key, 
    required this.title,
  });


  @override
  Widget build(BuildContext context) {
  final responsive = Responsive(context);
    return Padding(
      padding:  EdgeInsets.only(right: responsive.wp(1)),
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: responsive.hp(0.5)),
        decoration: BoxDecoration(
          border:  Border.all(color: Color(0xff0092D6))
        ),
      child: Text(title, style: TextStyle(color: Color(0xff0092D6), fontSize: responsive.ip(1.1)),),
      ),
    );
  }
}