import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:viva_city/presentation/widgets/widgets.dart';

class SigupScreen extends StatelessWidget {
  static const String name = 'signup_screen';

  const SigupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        const _Background(),
        SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width * 0.75,
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
                ElevatedButton(
                    onPressed: () {
                      //TODO: Validar ingreso con credenciales del usuario
                    },
                    style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 13, horizontal: 40)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Color(0xffE5A000)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)))),
                    child: const Text(
                      "CREAR CUENTA",
                      style: TextStyle(fontSize: 16, color: Color(0xffFFFFFF)),
                    )),
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
    return const SizedBox(
      width: double.infinity,
      height: 85,
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

class _Background extends StatelessWidget {
  const _Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset("assets/images/fondo.png", fit: BoxFit.cover),
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