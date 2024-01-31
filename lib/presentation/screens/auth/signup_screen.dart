import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/config/helpers/helpers.dart';
import 'package:viva_city/presentation/services/services.dart';
import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/screens/screens.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class SignupScreen extends StatelessWidget {
  static const String name = 'signup_screen';

  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final signupProvider = context.read<SignupProvider>();
    
    return Scaffold(
      body: Stack(
        children: [
          const AuthBackground(),
          SingleChildScrollView(
            controller: signupProvider.scrollController,
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(12.5)),
            child: SizedBox(
              height: responsive.hp(100),
              child: Column(
                children: [
                  const Spacer(flex: 4),
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
                  const Spacer(),
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
    final colors = Theme.of(context).colorScheme;
    final signupProvider = context.watch<SignupProvider>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Ya tienes una cuenta?",
          style: TextStyle(color: Colors.white, fontSize: responsive.ip(1.5), fontWeight: FontWeight.w300)
        ),
        CustomTextButton(
          text: 'Ingresa',
          color: colors.secondary,
          onPressed: () {
            context.pushReplacementNamed(LoginScreen.name);
            signupProvider.errorEmail = null;
            signupProvider.errorPassword = null;
            signupProvider.isVisibleOne = false;
            signupProvider.isVisibleTwo = false;
          }
        )
      ],
    );
  }
}

class _SignupForm extends StatefulWidget {
  const _SignupForm();

  @override
  State<_SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<_SignupForm> {
  late final GlobalKey<FormState> singupFormKey;

  @override
  void initState() {
    super.initState();
    singupFormKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    final singupFormKey = GlobalKey<FormState>();
    final responsive = Responsive(context);
    final firebaseAuthService = FirebaseAuthService();
    final signupProvider = context.read<SignupProvider>();

    return Form(
      key: singupFormKey,
      child: Column(
        children: [
          CustomTextFormField(
            keyboardType: TextInputType.name,
            title: "Nombre",
            label: "Coloca aquí tu nombre",
            prefixIcon: Icons.person,
            onChanged: (value) => signupProvider.name = value,
            validator: (value) {
              return (value == null || value.isEmpty) 
              ? 'Por favor ingrese su nombre'
              : null;
            },
          ),
          SizedBox(height: responsive.hp(2)),

          CustomTextFormField(
            keyboardType: TextInputType.emailAddress,
            title: "Correo electrónico",
            label: "Coloca aquí tu correo electrónico",
            prefixIcon: Icons.email,
            errorText: signupProvider.errorEmail,
            onChanged: (value) {
              signupProvider.errorEmail = null;
              signupProvider.email = value;
            },
            validator: (value) {
              String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);

              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un correo electrónico';
              } else if (!regExp.hasMatch(value)) {
                return 'El valor ingresado no luce como un correo';
              }

              return null;
            },
          ),
          SizedBox(height: responsive.hp(2)),
          
          CustomTextFormField(
            keyboardType: TextInputType.visiblePassword,
            title: "Contraseña",
            label: "Ingresa tu contraseña",
            prefixIcon: Icons.lock,
            suffixIcon: signupProvider.isVisibleOne ? Icons.visibility_off : Icons.visibility,
            errorText: signupProvider.errorPassword,
            isObscure: signupProvider.isVisibleOne,
            onPressed: () => signupProvider.isVisibleOne = !signupProvider.isVisibleOne,
            onChanged: (value) {
              signupProvider.errorPassword = null;
              signupProvider.password = value;
            },
            validator: (value) {
              String pattern =  r'^(?=.*?[A-Z])(?=.*?[0-9]).+$';
              RegExp regExp = RegExp(pattern);

              if (value == null || value.isEmpty) {
                return 'Por favor ingrese una contraseña';
              } else if (!regExp.hasMatch(value)){
                return 'Debe contener al menos una letra mayúscula y un dígito';
              } else if (value.length < 8) {
                return 'Mínimo 8 caracteres';
              }

              return null;
            },
          ),
          SizedBox(height: responsive.hp(2)),
          
          CustomTextFormField(
            keyboardType: TextInputType.visiblePassword,
            title: "Confirmar contraseña",
            label: "**************",
            prefixIcon: Icons.lock,
            suffixIcon: signupProvider.isVisibleTwo ? Icons.visibility_off : Icons.visibility,
            isObscure: signupProvider.isVisibleTwo,
            onPressed: () => signupProvider.isVisibleTwo = !signupProvider.isVisibleTwo,
            validator: (value) {
              if ((value == null || value.isEmpty) && signupProvider.password.isNotEmpty) {
                return 'Por favor confirme la contraseña';
              } else if (value != signupProvider.password) {
                return 'Las contraseñas no coinciden';
              }

              return null;
            },
          ),
          SizedBox(height: responsive.hp(2)),

          CustomTextFormField(
            keyboardType: TextInputType.phone,
            title: "Número teléfono",
            label: "Escribe tu número de teléfono",
            onInputChanged: (phone) {
              final prefix = phone.dialCode;
              String number = phone.parseNumber();
              if (phone.parseNumber().startsWith('0')){
                number = phone.parseNumber().substring(1);
              }
              signupProvider.phone = '$prefix$number';
            },
            onPhoneValidated: (value) => signupProvider.isValidNumber = value!,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un número de teléfono';
              } else if (!signupProvider.isValidNumber) {
                return 'Número de teléfono inválido';
              }
              
              return null;
            },
          ),
          SizedBox(height: responsive.hp(3)),

          CustomElevatedButton(
            text: "CREAR CUENTA",
            fontSize: responsive.ip(1.7),
            onPressed: signupProvider.isLoading ? null : () async {
              FocusScope.of(context).requestFocus(FocusNode());

              if (singupFormKey.currentState!.validate()) {
                signupProvider.isLoading = true;

                final errorMessage = await firebaseAuthService.createAccount(signupProvider.name.trim(), signupProvider.email.trim(), signupProvider.password.trim(), signupProvider.phone.trim(),);
                switch (errorMessage) {
                  case null:
                    signupProvider.isLoading = false;
                    Future.microtask(() => showSnackBar(context, 'Lo sentimos, no se pudo crear la cuenta.'));
                    break;
                  case 1:
                    signupProvider.isLoading = false;
                    signupProvider.errorEmail = 'El correo ya esta en uso';
                    break;
                  case 2:
                    signupProvider.isLoading = false;
                    signupProvider.errorPassword = 'La contraseña es débil';
                    break;
                  default:
                    context.read<ProfileProvider>().user = await firebaseAuthService.getUser();
                    Future.microtask(() async => await context.read<CategoryProvider>().loadData());
                    Future.microtask(() => context.pushReplacementNamed(SlidingScreen.name));
                    signupProvider.isLoading = false;
                    signupProvider.errorEmail = null;
                    signupProvider.errorPassword = null;
                    signupProvider.isVisibleOne = false;
                    signupProvider.isVisibleTwo = false;
                    break;
                }
              } else {
                await Future.delayed(const Duration(milliseconds: 10));
                signupProvider.moveScrollToBottom();
              }
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

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "REGISTRO",
            style: TextStyle(fontSize: responsive.ip(2), color: Colors.white),
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
