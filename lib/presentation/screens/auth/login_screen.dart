import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viva_city/config/theme/responsive.dart';

import 'package:viva_city/presentation/screens/screens.dart';
import 'package:viva_city/presentation/widgets/custom_elevated_button.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login_screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        const AuthBackground(),
        SingleChildScrollView(
          child: SizedBox(
            width: responsive.wp(75),
            child: Column(
              children: [
                SizedBox(
                  height: responsive.hp(25),
                ),
                const _TextInit(),
                 SizedBox(
                  height: responsive.ip(4.4),
                ),
                const _BoxLogin(),
                CustomElevatedButton(padding: EdgeInsets.symmetric(vertical: responsive.hp(1.2), horizontal: responsive.wp(8.5), 
                ), onPressed: () {
                  context.pushReplacementNamed(PresentationScreen.name);
                  //TODO: Validar ingreso con credenciales del usuario
                } , style: TextStyle(fontSize: responsive.ip(1.5)),
                text: "INGRESAR",),
                const _ButtonIngresarAndText(),
                const _SocialAccounts(
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class _SocialAccounts extends StatelessWidget {
  const _SocialAccounts({
    super.key,
   
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Column(
      children: [
         Text(
          "O avanza con tus cuentas sociales",
          style: TextStyle(color: const Color(0xffFFFFFF), fontSize: responsive.ip(1.1)),
        ),
        Container(
          padding:  EdgeInsets.symmetric(vertical: responsive.ip(0.95), horizontal: responsive.ip(2.3)),
          margin:  EdgeInsets.only(top: responsive.ip(0.95)),
          decoration: BoxDecoration(
              color: const Color(0xffFFFFFF).withOpacity(0.20),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child:  Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                      image: AssetImage(
                    "assets/images/logo_google.png",
                  )),
                  Text(
                    "Continuar\ncon Google",
                    style: TextStyle(
                      color: const Color(0xffFFFFFF),
                      fontSize: responsive.ip(0.9),
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              SizedBox(
                width: responsive.ip(2.5),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                      image: AssetImage(
                    "assets/images/logo_facebook.png",
                  )),
                  Text(
                    "Continuar\ncon Facebook",
                    style: TextStyle(
                      color: const Color(0xffFFFFFF),
                      fontSize: responsive.ip(0.9),
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _ButtonIngresarAndText extends StatelessWidget {
  const _ButtonIngresarAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(
            height: responsive.ip(3.5),
            child: TextButton(
              onPressed: () {
                //TODO:Navegar pantalla de recuperacion de contraseña
              },
              child:  Text(
                "Olvidaste tu contraseña?",
                style: TextStyle(color: const Color(0xffFFFFFF), fontSize: responsive.ip(1.3)),
              ),
            ),
          ),
          SizedBox(
            height: responsive.ip(3.5),
            child: TextButton(
                onPressed: () => context.pushNamed(SigupScreen.name),
                child:  Text(
                  "Registrarse",
                  style: TextStyle(
                    color: const Color(0xffFFFFFF),
                    fontSize: responsive.ip(1.3),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class _BoxLogin extends StatelessWidget {
  const _BoxLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return  Form(
      // TODO: crear la llave del formulario
      child: Column(
      children: [
        const CustomTextFormField(
            title: "Correo electrónico/número teléfono",
            label: "Ingresa tu correo electrónico o número",
            prefixIcon: Icons.email),
        SizedBox(
          height: responsive.ip(2.5),
        ),
        const CustomTextFormField(
          title: "Contraseña",
          label: "Ingresa tu contraseña",
          prefixIcon: Icons.lock,
          suffixIcon: Icons.remove_red_eye,
          noVisibility: true,
        ),
        SizedBox(
          height: responsive.ip(4.5),
        )
      ],
    ));
  }
}

class _TextInit extends StatelessWidget {
  const _TextInit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "INGRESAR",
          style: TextStyle(color: const Color(0xffFFFFFF), fontSize: responsive.ip(2.2)),
        ),
        Text(
          "¡Disfruta tu ciudad! Bienvenido...",
          style: TextStyle(color: const Color(0xffE5A000), fontSize: responsive.ip(2.0)),
        ),
        SizedBox(
          height: responsive.hp(0.5),
        ),
        const Text(
          "Ingresa tus datos para continuar",
          style: TextStyle(color: Color(0xffFFFFFF)),
        ),
      ],
    );
  }
}
