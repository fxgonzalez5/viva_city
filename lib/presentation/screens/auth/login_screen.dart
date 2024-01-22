import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/config/helpers/helpers.dart';
import 'package:viva_city/presentation/services/services.dart';
import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/screens/screens.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login_screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final loginProvider = context.read<LoginProvider>();

    return Scaffold(
      body: Stack(
        children: [
          const AuthBackground(),
          SingleChildScrollView(
            controller: loginProvider.scrollController,
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(12.5)),
            child: SizedBox(
              height: responsive.hp(100),
              child: Column(
                children: [
                  const Spacer(flex: 4),
                  const _HeaderText(),
                  SizedBox(height: responsive.hp(5)),
                  const _LoginForm(),
                  const _NavigationTextButtons(),
                  Text(
                    'O avanza con tus cuentas sociales',
                    style: TextStyle(color: Colors.white, fontSize: responsive.ip(1.2))
                  ),
                  const _AuthBox(),
                  const Spacer()
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
    final loginProvider = context.read<LoginProvider>();
    
    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsive.hp(2)),
      child: Column(
        children: [
          CustomTextButton(
            text: 'Olvidaste tu contraseña?',
            onPressed: () {
              // TODO: Navegar pantalla de recuperacion de contraseña
              // loginProvider.errorEmail = null;
              // loginProvider.errorPassword = null;
              // loginProvider.isVisible = false;
            }
          ),
          
          CustomTextButton(
            text: 'Registrarse',
            onPressed: () {
              context.pushReplacementNamed(SignupScreen.name);
              loginProvider.errorEmail = null;
              loginProvider.errorPassword = null;
              loginProvider.isVisible = false;
            }
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
    final firebaseAuthService = FirebaseAuthService();
    final loginProvider = context.watch<LoginProvider>();
    
    return Form(
      key: loginProvider.loginFormKey,
      child: Column(
        children: [
          CustomTextFormField(
            keyboardType: TextInputType.emailAddress,
            title: "Correo electrónico",
            label: "Ingresa tu correo electrónico",
            prefixIcon: Icons.email,
            errorText: loginProvider.errorEmail,
            onChanged: (value) {
              loginProvider.errorEmail = null;
              loginProvider.email = value;
            },
            validator: (value) {
              String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);

              if (value == null || value.isEmpty) {
                return 'Por favor ingrese el correo electrónico';
              } else if (!regExp.hasMatch(value)) {
                return 'El valor ingresado no luce como un correo';
              }

              return null;
            },
          ),
          SizedBox(height: responsive.hp(2.5)),
          CustomTextFormField(
            keyboardType: TextInputType.visiblePassword,
            title: "Contraseña",
            label: "Ingresa tu contraseña",
            prefixIcon: Icons.lock,
            suffixIcon: loginProvider.isVisible ? Icons.visibility_off : Icons.visibility,
            errorText: loginProvider.errorPassword,
            isObscure: loginProvider.isVisible,
            onPressed: () => loginProvider.isVisible = !loginProvider.isVisible,
            onChanged: (value) {
              loginProvider.errorPassword = null;
              loginProvider.password = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese la contraseña';
              } else if (value.length < 8) {
                return 'Mínimo 8 caracteres';
              }

              return null;
            },
          ),
          SizedBox(height: responsive.hp(5)),
          CustomElevatedButton(
            text: "INGRESAR",
            fontSize: responsive.ip(1.7),
            onPressed: loginProvider.isLoading ? null : () async {
              FocusScope.of(context).requestFocus(FocusNode());

              if (loginProvider.isValidForm()) {
                loginProvider.isLoading = true;

                final errorMessage = await firebaseAuthService.login(loginProvider.email.trim(), loginProvider.password.trim());
                switch (errorMessage) {
                  case null:
                    loginProvider.isLoading = false;
                    Future.microtask(() => showSnackBar(context, 'Lo sentimos, no se pudo iniciar sesión.'));
                    break;
                  case 1:
                    loginProvider.isLoading = false;
                    loginProvider.errorEmail = 'No se ha encontrado una cuenta con ese correo electrónico';
                    break;
                  case 2:
                    loginProvider.isLoading = false;
                    loginProvider.errorPassword = 'Correo o contraseña incorrecto';
                    break;
                  case 3:
                    loginProvider.isLoading = false;
                    loginProvider.errorEmail = 'Correo o contraseña inválido';
                    loginProvider.errorPassword = 'Correo o contraseña inválido';
                    break;
                  default:
                    context.read<ProfileProvider>().user = await firebaseAuthService.getUser();
                    Future.microtask(() async => await context.read<CategoryProvider>().loadData());
                    Future.microtask(() => context.pushReplacementNamed(NavegationScreen.name));
                    loginProvider.isLoading = false;
                    loginProvider.errorEmail = null;
                    loginProvider.errorPassword = null;
                    loginProvider.isVisible = false;
                    break;
                }
              } else {
                await Future.delayed(const Duration(milliseconds: 10));
                loginProvider.moveScrollToBottom();
              }
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

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "INGRESAR",
            style: TextStyle(fontSize: responsive.ip(2), color: Colors.white),
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
