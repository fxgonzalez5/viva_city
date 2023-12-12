import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/screens/screens.dart';
import 'package:viva_city/presentation/widgets/custom_elevated_button.dart';

import 'package:viva_city/presentation/widgets/widgets.dart';

class SigupScreen extends StatelessWidget {
  static const String name = 'signup_screen';

  const SigupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        const AuthBackground(),
        SingleChildScrollView(
          child: SizedBox(
            height: responsive.hp(100),
            width: responsive.wp(75),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(
                  flex: 8,
                ),
                const _TextInit(),
                const SizedBox(
                  height: 20,
                ),
                const _BoxLogin(),
                CustomElevatedButton(padding: EdgeInsets.symmetric(vertical: responsive.hp(1.2), horizontal: responsive.wp(8.5), 
                ), style: TextStyle(fontSize: responsive.ip(1.5)), onPressed: () {
                  context.pushReplacementNamed(PresentationScreen.name);
                  //TODO: Validar ingreso con credenciales del usuario
                },
                text: "CREAR CUENTA",),
                const _ButtonIngresarAndText(),
                const Spacer(
                  flex: 1,
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}



class _ButtonIngresarAndText extends StatelessWidget {
  const _ButtonIngresarAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Ya tienes una cuenta?",
                style: TextStyle(
                  color: Color(0xffFFFFFF)
                  ),
                ),
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text("Ingresa",
                    style: TextStyle(
                    color: Color(0xffE5A000)
                ),)),
              ],
            ),
          ),
          const Text("Al continuar, confirmas que estás de acuerdo con los Términos y Condiciones de\n"
                "VIVATurismo y Cultura y afirmas haber leído nuestra Política de Privacidad.", 
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 9,
                ) ,
                textAlign:TextAlign.center,),
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
    return const Form(
      // TODO: crear la llave del formulario
      child: Column(
      children: [
        CustomTextFormField(
            title: "Nombre",
            label: "Coloca aquí tu nombre",
            prefixIcon: Icons.person_2),
        SizedBox(
          height: 20,
        ),
        CustomTextFormField(
            title: "Correo electrónico",
            label: "Coloca aquí tu correo electrónico",
            prefixIcon: Icons.email),
        SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          title: "Contraseña",
          label: "Ingresa tu contraseña",
          prefixIcon: Icons.lock,
          suffixIcon: Icons.remove_red_eye,
          noVisibility: true,
        ),
        SizedBox(height: 20,),
        CustomTextFormField(
          title: "Confirmar contraseña",
          label: "**************",
          prefixIcon: Icons.lock,
          suffixIcon: Icons.remove_red_eye,
          noVisibility: true,
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          title: "Número teléfono",
          label: "Escribe tu número de teléfono",
          prefixIcon: Icons.phone,
        ),
        SizedBox(
          height: 30,
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
    return SizedBox(
      width: double.infinity,
      height: responsive.ip(10) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "REGISTRO",
            style: TextStyle(color: Color(0xffFFFFFF), fontSize: 24),
          ),
          SizedBox(
            height:10 ,),
          Text(
            "Ingresa tu información básica a continuación",
            style: TextStyle(color: Color(0xffFFFFFF), fontSize: 14),
          ),
        ],
      ),
    );
  }
}
