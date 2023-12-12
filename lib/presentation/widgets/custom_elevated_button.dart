import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viva_city/presentation/screens/presentation/presentation_screen.dart';

class CustomElevatedButton extends StatelessWidget {
  final  EdgeInsets padding;
  final  String text;
  final  TextStyle? style; 

  const CustomElevatedButton({
    super.key, required this.padding, required this.text, this.style,
  });


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.pushReplacementNamed(PresentationScreen.name);
          //TODO: Validar ingreso con credenciales del usuario
        },
        style: ButtonStyle(
            padding: MaterialStatePropertyAll(
              padding
            ),
            backgroundColor:
                const MaterialStatePropertyAll(Color(0xffE5A000)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7)))),
        child:  Text(
          text,
          style: style 
        ));
  }
}