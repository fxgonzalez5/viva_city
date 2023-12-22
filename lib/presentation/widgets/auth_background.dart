import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset("assets/images/background.png", fit: BoxFit.cover),
        ),
        Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            const Color(0xff3D238E).withOpacity(0.85),
            const Color(0xff3D23CC).withOpacity(0.85),
          ]),
        )),
        Positioned(
            top: -10, left: -55, child: Image.asset("assets/images/logo_viva_city.png")),
      ],
    );
  }
}
