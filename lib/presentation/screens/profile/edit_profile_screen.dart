import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:viva_city/config/helpers/helpers.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/services/services.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';


class EditProfileScreen extends StatelessWidget {
  static const String name = 'edit_profile_screen';

  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;
    final userProvider = context.read<ProfileProvider>();
    
    return Scaffold(
      appBar: AppBar(),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          context.pop();
          userProvider.newPictureFile = null;
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(7.5)),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: responsive.hp(2)),
                  child: Text('Editar Perfil', style: texts.headlineSmall),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(responsive.wp(5)),
                  decoration: _buildBoxDecoration(responsive),
                  child: const _ProfileForm(),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: responsive.hp(2)),
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(colors.secondary)),
                      onPressed: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        final firebaseAuthService = FirebaseAuthService();
                        final updatedUser = userProvider.user!.copyWith(
                          photo: await firebaseAuthService.uploadImage(userProvider.newPictureFile),
                          name: userProvider.name,
                          phone: userProvider.phone,
                          birthdate: userProvider.birthdate,
                          city: userProvider.city,
                          province: userProvider.province,
                          country: userProvider.country,
                          interests: userProvider.interests,
                          eventNotification: userProvider.eventNotification,
                          promotionsNotification: userProvider.promotionsNotification,
                          emailNotification: userProvider.emailNotification
                        );
        
                        if (updatedUser.equals(userProvider.user!)) {
                          Future.microtask(() => showSnackBar(context, 'No se ha realizado ninguna modificación'));
                        } else if (userProvider.isValidForm()) {
                          final errorMessage = await firebaseAuthService.updateUser(updatedUser);
                          if (errorMessage == 0) {
                            userProvider.user = await firebaseAuthService.getUser();
                            Future.microtask(() => context.pop());
                          } else {
                            Future.microtask(() => showSnackBar(context, 'Error, no se pudo actualizar los datos'));
                          }
                        }
                      }, 
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: responsive.wp(4)),
                        child: Text('Guardar', style: TextStyle(fontSize: responsive.ip(1.4))),
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration(Responsive responsive) {
    return BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(responsive.ip(1))
    );
  }
}

class _ProfileForm extends StatelessWidget {
  const _ProfileForm();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    final userProvider = context.watch<ProfileProvider>();

    return Form(
      key: userProvider.editFormKey,
      child: Column(
        children: [
          CustomCircleAvatar(
            imagePath: userProvider.newPictureFile == null ? userProvider.user?.photo : userProvider.newPictureFile!.path,
            radius: responsive.wp(25)
          ),
          CustomTextButton(
            text: 'Cambiar foto',
            color: colors.secondary,
            onPressed: () async {
              final image = await userProvider.getImage();
              if (image == null) return;
              await userProvider.cropImage(File(image.path));
            }
          ),
          const _PersonalData(),
          const _Interests(),
          const _Notifications(),
          CustomListTile(
            icon: Icons.payments_outlined,
            iconColor: Colors.grey.shade800,
            label: 'Métodos de pago',
            labelStyle: TextStyle(fontSize: responsive.ip(1.7)),
          ),
        ],
      ),
    );
  }
}

class _Notifications extends StatelessWidget {
  const _Notifications();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final userProvider = context.watch<ProfileProvider>();
    final textStyle = TextStyle(color: Colors.black87, fontSize: responsive.ip(1.4));

    return Column(
      children: [
        CustomListTile(
          icon: Icons.notifications_outlined,
          iconColor: Colors.grey.shade800,
          label: 'Notificaciones',
          labelStyle: TextStyle(fontSize: responsive.ip(1.7)),
        ),
        Padding(
          padding: EdgeInsets.only(left: responsive.wp(10)),
          child: Column(
            children: [
              SwitchListTile(
                title: Text('Deseo recibir notificaciones sobre nuevos eventos', style: textStyle),
                value: userProvider.eventNotification,
                onChanged: (value) => userProvider.eventNotification = value,
              ),
              SwitchListTile(
                title: Text('Deseo recibir notificaciones sobre promociones', style: textStyle),
                value: userProvider.promotionsNotification,
                onChanged: (value) => userProvider.promotionsNotification = value,
              ),
              SwitchListTile(
                title: Text('Deseo recibir notificaciones vía correo electrónico', style: textStyle),
                value: userProvider.emailNotification,
                onChanged: (value) => userProvider.emailNotification = value,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Interests extends StatelessWidget {
  const _Interests();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    final userProvider = context.watch<ProfileProvider>();

    return Column(
      children: [
        CustomListTile(
          icon: Icons.interests_outlined,
          iconColor: Colors.grey.shade800,
          label: 'Intereses',
          labelStyle: TextStyle(fontSize: responsive.ip(1.7)),
        ),
        SizedBox(height: responsive.hp(0.5)),
        Padding(
          padding: EdgeInsets.only(left: responsive.wp(10)),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: userProvider.interests.map(
              (interest) => Card(
                color: Colors.grey.shade400,
                child: Padding(
                  padding: EdgeInsets.only(left: responsive.wp(2)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(interest, style: TextStyle(color: Colors.black87, fontSize: responsive.ip(1.4))),
                      IconButton(
                        visualDensity: VisualDensity.comfortable,
                        icon: const Icon(Icons.clear),
                        onPressed: () => userProvider.removeInterest(interest), 
                      )
                    ],
                  ),
                ),
              ),
            ).toList()
          ),
        ),
         _CustomTextFormField(
          controller: userProvider.interestController,
          focusNode: userProvider.focusInterest,
          prefix: Text('Añadir: ', style: TextStyle(color: colors.secondary, fontSize: responsive.ip(1.4)),), 
          onFieldSubmitted: (value) {
            if (userProvider.interestController.text.trim().isEmpty) return;
            userProvider.interestController.clear();
            userProvider.addInterest(value);
            FocusScope.of(context).requestFocus(userProvider.focusInterest);
          },
        ),
      ],
    );
  }
}

class _PersonalData extends StatelessWidget {
  const _PersonalData();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final userProvider = context.watch<ProfileProvider>();

    return Column(
      children: [
        CustomListTile(
          icon: Icons.badge_outlined,
          iconColor: Colors.grey.shade800,
          label: 'Datos personales',
          labelStyle: TextStyle(fontSize: responsive.ip(1.7)),
        ),
        SizedBox(height: responsive.hp(0.5)),
        _CustomTextFormField(
          label: 'Nombre de usuario',
          initialValue: userProvider.user?.name,
          keyboardType: TextInputType.name,
          onChanged: (value) => userProvider.name = value.trim(),
          validator: (value) {
            return (value == null || value.isEmpty) 
              ? 'Por favor ingrese su nombre'
              : null;
          },
        ),
        _CustomTextFormField(
          readOnly: true,
          label: 'Correo electrónico',
          initialValue: userProvider.user?.email,
        ),
        _CustomTextFormField(
          label: 'Teléfono',
          initialValue: userProvider.phone,
          keyboardType: TextInputType.phone,
          onInputChanged: (phone) {
            final prefix = phone.dialCode;
              String number = phone.parseNumber();
              if (phone.parseNumber().startsWith('0')){
                number = phone.parseNumber().substring(1);
              }
              userProvider.phone = '$prefix$number';
          },
          onPhoneValidated: (value) => userProvider.isValidNumber = value!,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor ingrese su teléfono';
            } else if (!userProvider.isValidNumber) {
              return 'Número de teléfono inválido';
            }
            
            return null;
          },
        ),
        _CustomTextFormField(
          controller: userProvider.birthdateController,
          readOnly: true,
          label: 'Fecha de Nacimiento',
          onTap: () async {
            DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: userProvider.user?.birthdate ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            
            if (newDate == null) return;
            userProvider.birthdate = newDate;
            final dateConversion = DateFormat('dd-MM-yyyy');
            userProvider.birthdateController.text = dateConversion.format(newDate);
          },
        ),
        _CustomTextFormField(
          label: 'País',
          initialValue: userProvider.user?.country,
          onChanged: (value) => userProvider.country = value.trim(),
          validator: (value) {
            if (value == null || value.isEmpty) return null;

            if (value.trim().isEmpty && userProvider.country != null){
              return 'No pueden ser espacios en blanco';
            } else if (value.isNotEmpty && value.trim().length < 4){
              return 'No es un nombre de país';
            }
            return null;
          },
        ),
        _CustomTextFormField(
          readOnly: userProvider.country == null ? true : false,
          label: 'Estado o Provincia',
          initialValue: userProvider.user?.province,
          onChanged: (value) => userProvider.province = value.trim(),
          validator: (value) {
            if (userProvider.country != null && userProvider.country!.isNotEmpty && userProvider.country!.length > 3) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su estado o provincia';
              } else if (value.trim().isEmpty && userProvider.province != null) {
                return 'No pueden ser espacios en blanco';
              } else if (value.isNotEmpty && value.trim().length < 4) {
                return 'No es un nombre de estado o provincia';
              }  
            } 
            
            return null;
          },
          onTap: () {
            if (userProvider.country == null) {
              showSnackBar(context, 'Debe ingresar su país');
            }
          },
        ),
        _CustomTextFormField(
          readOnly: userProvider.province == null ? true : false,
          label: 'Ciudad',
          initialValue: userProvider.user?.city,
          onChanged: (value) => userProvider.city = value.trim(),
          validator: (value) {
            if (userProvider.province != null && userProvider.province!.isNotEmpty && userProvider.province!.length > 3) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su ciudad';
              } else if (value.trim().isEmpty && userProvider.province != null) {
                return 'No pueden ser espacios en blanco';
              } else if (value.isNotEmpty && value.trim().length < 4) {
                return 'No es un nombre de ciudad';
              }  
            } 
            
            return null;
          },
          onTap: () {
            if (userProvider.country == null) {
              showSnackBar(context, 'Debe ingresar su país');
            } else if (userProvider.province == null) {
              showSnackBar(context, 'Debe ingresar su estado o provincia');
            }
          },
        ),
      ],
    );
  }
}

class _CustomTextFormField extends StatelessWidget {
  final Widget? prefix;
  final String? label;
  final TextEditingController? controller;
  final String? initialValue;
  final bool readOnly;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final VoidCallback? onTap;
  final Function(bool?)? onPhoneValidated;
  final Function(PhoneNumber)? onInputChanged;

  const _CustomTextFormField({
    this.prefix,
    this.label,
    this.controller,
    this.initialValue,
    this.readOnly = false,
    this.keyboardType,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.onPhoneValidated,
    this.onInputChanged
    });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    
    final PhoneNumber number = PhoneNumber(isoCode: 'EC', phoneNumber: initialValue);
    final style = TextStyle(color: Colors.black87, fontSize: responsive.ip(1.5));
    final decoration = InputDecoration(
      filled: false,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey)
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey)
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colors.primary, width: 2)
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colors.primary)
      ),
      prefixIconConstraints: const BoxConstraints(maxHeight: double.maxFinite),
      prefixIcon: prefix,
      labelText: label,
      errorStyle: TextStyle(color: colors.primary)
    );

    return Padding(
      padding: EdgeInsets.only(left: responsive.wp(10), bottom: responsive.hp(1.5)),
      child: keyboardType != TextInputType.phone
      ? TextFormField(
          controller: controller,
          initialValue: initialValue,
          style: style,
          autocorrect: false,
          readOnly: readOnly,
          keyboardType: keyboardType,
          focusNode: focusNode,
          textAlignVertical: TextAlignVertical.bottom,
          textCapitalization: keyboardType == TextInputType.name ? TextCapitalization.words : TextCapitalization.none,
          decoration: decoration,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
        )
      : InternationalPhoneNumberInput(
          initialValue: number,
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.DIALOG,
            useEmoji: true,
            setSelectorButtonAsPrefixIcon: false,
            leadingPadding: 15,
            trailingSpace: false,
            useBottomSheetSafeArea: true,
          ),
          textStyle: style,
          selectorTextStyle: style,
          hintText: label,
          inputDecoration: decoration,
          searchBoxDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: responsive.wp(3)),
            fillColor: Colors.white,
            hintText: 'Buscar por nombre de país',
            hintStyle: TextStyle(color: Colors.black38, fontSize: responsive.ip(1.6)),
          ),
          onInputValidated: onPhoneValidated,
          validator: validator,
          onInputChanged: onInputChanged,
        ),
    );
  }
}