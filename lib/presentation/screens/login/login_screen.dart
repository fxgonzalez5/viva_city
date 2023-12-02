import 'package:flutter/material.dart';
import 'package:viva_city/presentation/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        const Background(),
        SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(
                  flex: 3,
                ),
                const TextInit(),
                const SizedBox(
                  height: 50,
                ),
                const BoxLogin(),
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
                      "INGRESAR",
                      style: TextStyle(fontSize: 16, color: Color(0xffFFFFFF)),
                    )),
                const ButtonIngresarAndText(),
                SocialAccounts(
                  size: size,
                ),
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

class SocialAccounts extends StatelessWidget {
  final Size size;
  const SocialAccounts({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "O avanza con tus cuentas sociales",
          style: TextStyle(color: Color(0xffFFFFFF), fontSize: 12),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              color: const Color(0xffFFFFFF).withOpacity(0.20),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage(
                    "assets/images/googleLogin.png",
                  )),
                  Text(
                    "Continuar \n con Google",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage(
                    "assets/images/facebookLogin.png",
                  )),
                  Text(
                    "Continuar \n con Facebook",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 10,
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

class ButtonIngresarAndText extends StatelessWidget {
  const ButtonIngresarAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: TextButton(
              onPressed: () {
                //TODO:Navegar pantalla de recuperacion de contraseña
              },
              child: const Text(
                "Olvidaste tu contraseña?",
                style: TextStyle(color: Color(0xffFFFFFF), fontSize: 14),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: TextButton(
                onPressed: () {
                  //TODO:Navegar pantalla de registro 
                },
                child: const Text(
                  "Registrarse",
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 14,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class BoxLogin extends StatelessWidget {
  const BoxLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Form(
      // TODO: crear la llave del formulario
      child: Column(
      children: [
        CustomTextFormField(
            title: "Correo electrónico/número teléfono",
            label: "Ingresa tu correo electrónico o número",
            prefixIcon: Icons.email),
        SizedBox(
          height: 30,
        ),
        CustomTextFormField(
          title: "Contraseña",
          label: "Ingresa tu contraseña",
          prefixIcon: Icons.lock,
          suffixIcon: Icons.remove_red_eye,
          noVisibility: true,
        ),
        SizedBox(
          height: 50,
        )
      ],
    ));
  }
}

class TextInit extends StatelessWidget {
  const TextInit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "INGRESAR",
            style: TextStyle(color: Color(0xffFFFFFF), fontSize: 24),
          ),
          Text(
            "¡Disfruta tu ciudad! Bienvenido...",
            style: TextStyle(color: Color(0xffE5A000), fontSize: 22),
          ),
          Text(
            "Ingresa tus datos para continuar",
            style: TextStyle(color: Color(0xffFFFFFF)),
          ),
        ],
      ),
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
            top: -10, left: -55, child: Image.asset("assets/images/LogoV.png")),
      ],
    );
  }
}
