import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset("assets/images/fondo.png", fit: BoxFit.cover),
        ),

        Positioned(top: -12, left: -60, child: Image.asset("assets/images/logo_app.png", width: responsive.wp(45))),

        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xff3D238E).withOpacity(0.85),
                const Color(0xff3D23CC).withOpacity(0.85),
              ]
            ),
          )
        ),
      ],
    );
  }
}
