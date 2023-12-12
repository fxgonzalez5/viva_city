import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/screens/auth/signup_screen.dart';
import 'package:viva_city/presentation/screens/screens.dart';

class PresentationScreen extends StatelessWidget {
  static const String name = 'presentation_screen';
  const PresentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      body: Stack(
      alignment: Alignment.center,
      children: [
        const Background(),
        LineDivider(responsive: responsive),
        AllText(responsive: responsive),
        Column(
          children: [
            SizedBox(
              height: responsive.hp(79.5),
            ),
            IconButton(
              onPressed: (){},
              //TODO: animacion.
              icon:  Icon(Icons.expand_less, size: responsive.ip(7)),
              color: const Color(0xffE5A000),)
              
          ],
        )
      ],
    ),
  );  
  }
}

class AllText extends StatelessWidget {
  const AllText({
    super.key,
    required this.responsive,
  });

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Column( 
      children: [
        SizedBox(
          height: responsive.hp(37),
        ),
        Text('Vive la cultura en',
        style: TextStyle(
          fontSize: responsive.ip(3.2),
          color: Colors.white,
          
        ),),
        Text('LOJA', style: TextStyle(
          fontSize: responsive.ip(5.2),
          color: Colors.white,
          height: responsive.hp(0.09)
        ),),
        SizedBox(
          height: responsive.hp(5),
        ),
        Text('Hoy es un día para disfrutar',
        style: TextStyle(
          fontSize: responsive.ip(2.2),
          color: Colors.white
        ),),
        SizedBox(
          height: responsive.hp(5.5),
        ),
        Icon(Icons.explore_outlined, color: Colors.white, size: responsive.ip(4),),
        SizedBox(
          height: responsive.hp(1.5),
        ),
        Text('¿Qué tengo cerca?', style: TextStyle(
          fontSize: responsive.ip(2),
          color: Colors.white))
      ],
    );
  }
}

class LineDivider extends StatelessWidget {
  const LineDivider({
    super.key,
    required this.responsive,
  });

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: responsive.hp(56),
        ),
        Divider(
            height: responsive.hp(0.1),
            thickness: responsive.hp(0.1),
            indent: responsive.ip(9.5),
            endIndent: responsive.ip(9.5),
            color: const Color(0xffE5A000),
        ),
      ],
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset("assets/images/slide1.png", fit: BoxFit.cover),
        ),
        Container(
            decoration:  BoxDecoration(
              color: const Color(0xff1D1D1B).withOpacity(0.70),
        )),
      ],
    );
  }
}