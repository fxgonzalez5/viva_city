import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/screens/screens.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class SignupScreen extends StatelessWidget {
  static const String name = 'signup_screen';

  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    
    return Scaffold(
      body: Stack(
        children: [
          const AuthBackground(),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: responsive.wp(12.5)),
              child: Column(
                children: [
                  SizedBox(height: responsive.hp(22.5)),
                  const _HeaderText(),
                  SizedBox(height: responsive.hp(3)),
                  const _SignupForm(),
                  SizedBox(height: responsive.hp(1.5)),
                  const _NavegationText(),
                  Text(
                    'Al continuar, confirmas que estás de acuerdo con los Términos y Condiciones de VIVATurismo y Cultura y afirmas haber leído nuestra Política de Privacidad.', 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.ip(0.8),
                    ) ,
                    textAlign:TextAlign.center,
                  ),
                  SizedBox(height: responsive.hp(2)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



class _NavegationText extends StatelessWidget {
  const _NavegationText();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final fontSize = responsive.ip(1.5);
    final colors = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Ya tienes una cuenta?",
          style: TextStyle(color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.w300)
        ),
        CustomTextButton(
          text: 'Ingresa',
          color: colors.secondary,
          onPressed: () => context.pushReplacementNamed(LoginScreen.name),
        )
      ],
    );
  }
}

class _SignupForm extends StatelessWidget {
  const _SignupForm();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Form(
      // key: ,
      child: Column(
        children: [
          CustomTextFormField(
            title: "Nombre",
            label: "Coloca aquí tu nombre",
            prefixIcon: Icons.person,
            // onChanged: (value) => loginForm.email = value,
            validator: (value) {
              return '';
            },
          ),
          SizedBox(height: responsive.hp(2)),

          CustomTextFormField(
            title: "Correo electrónico",
            label: "Coloca aquí tu correo electrónico",
            prefixIcon: Icons.email,
            // onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);

              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'El valor ingresado no luce como un correo';
            },
          ),
          SizedBox(height: responsive.hp(2)),
          
          CustomTextFormField(
            title: "Contraseña",
            label: "Ingresa tu contraseña",
            prefixIcon: Icons.lock,
            suffixIcon: Icons.remove_red_eye,
            noVisibility: true,
            // onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 8)
                  ? null
                  : 'Mínimo 8 caracteres';
            },
          ),
          SizedBox(height: responsive.hp(2)),
          
          CustomTextFormField(
            title: "Confirmar contraseña",
            label: "**************",
            prefixIcon: Icons.lock,
            suffixIcon: Icons.remove_red_eye,
            noVisibility: true,
            // onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 8)
                  ? null
                  : 'Mínimo 8 caracteres';
            },
          ),
          SizedBox(height: responsive.hp(2)),

          CustomTextFormField(
            title: "Número teléfono",
            label: "Escribe tu número de teléfono",
            prefixIcon: Icons.phone_android,
            // onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 8)
                  ? null
                  : 'Mínimo 8 caracteres';
            },
          ),
          SizedBox(height: responsive.hp(3)),

          CustomElevatedButton(
            text: "CREAR CUENTA",
            onPressed: () {
              context.pushReplacementNamed(SlidingScreen.name);
              //TODO: Crear las credenciales del usuario
            },
          ),
        ],
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "REGISTRO",
            style: texts.headlineSmall
          ),
          SizedBox(height: responsive.hp(0.5)),
          const Text(
            "Ingresa tu información básica a continuación",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
