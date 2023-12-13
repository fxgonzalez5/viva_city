import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/screens/screens.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login_screen';

  const LoginScreen({super.key});

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
                  SizedBox(height: responsive.hp(28)),
                  const _HeaderText(),
                  SizedBox(height: responsive.hp(5)),
                  const _LoginForm(),
                  const _NavigationTextButtons(),
                  Text(
                    'O avanza con tus cuentas sociales',
                    style: TextStyle(color: Colors.white, fontSize: responsive.ip(1.2))
                  ),
                  const _AuthBox(),
                  SizedBox(height: responsive.hp(6.5)),
                ],
              ),
            ),
          )
      ]),
    );
  }
}

class _AuthBox extends StatelessWidget {
  const _AuthBox();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: responsive.hp(1)),
          padding: EdgeInsets.symmetric(vertical: responsive.hp(0.75), horizontal: responsive.wp(6)),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(responsive.ip(0.75)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _AuthButton(
                assetName: 'assets/images/logo_google.png',
                label: 'Continuar\ncon Google',
                onTap: () {
                  // TODO: Implementar la autentificación con Google
                },
              ),
              SizedBox(width: responsive.wp(8)),
              _AuthButton(
                assetName: 'assets/images/logo_facebook.png',
                label: 'Continuar\ncon Facebook',
                onTap: () {
                  // TODO: Implementar la autentificación con Facebook
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AuthButton extends StatelessWidget {
  final String assetName;
  final String label;
  final VoidCallback? onTap;
  
  const _AuthButton({
    required this.assetName,
    required this.label,
    this.onTap
  });


  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(assetName),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: responsive.ip(1),
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class _NavigationTextButtons extends StatelessWidget {
  const _NavigationTextButtons();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    
    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsive.hp(2)),
      child: Column(
        children: [
          CustomTextButton(
            text: 'Olvidaste tu contraseña?',
            onPressed: () {
              // TODO: Navegar pantalla de recuperacion de contraseña
            }
          ),
          
          CustomTextButton(
            text: 'Registrarse',
            onPressed: () => context.pushReplacementNamed(SignupScreen.name)
          ),
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    
    return Form(
      // key: ,
      child: Column(
        children: [
          CustomTextFormField(
            title: "Correo electrónico/número teléfono",
            label: "Ingresa tu correo electrónico o número",
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
          SizedBox(height: responsive.hp(2.5)),
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
          SizedBox(height: responsive.hp(5)),
          CustomElevatedButton(
            text: "INGRESAR",
            onPressed: () {
              context.pushReplacementNamed(SlidingScreen.name);
              //TODO: Validar ingreso con credenciales del usuario
            },
          ),
        ],
      ));
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "INGRESAR",
            style: texts.headlineSmall,
          ),
          Text(
            "¡Disfruta tu ciudad! Bienvenido...",
            style: TextStyle(color: colors.secondary, fontSize: responsive.ip(2)),
          ),
          SizedBox(height: responsive.hp(0.5)),
          const Text(
            "Ingresa tus datos para continuar",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
