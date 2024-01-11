import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';


class EditProfileScreen extends StatelessWidget {
  static const String name = 'edit_profile_screen';

  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
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
              SizedBox(height: responsive.hp(2)),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(colors.secondary)),
                  onPressed: () => context.pushNamed(EditProfileScreen.name), 
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: responsive.wp(4)),
                    child: Text('Guardar', style: TextStyle(fontSize: responsive.ip(1.4))),
                  )
                ),
              )
            ],
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
      child: Column(
        children: [
          CustomCircleAvatar(
            imagePath: userProvider.user?.photoUrl,
            radius: responsive.wp(25)
          ),
          CustomTextButton(
            text: 'Cambiar foto',
            color: colors.secondary,
            onPressed: () {
              // TODO: Abrir la galeria y guardar la foto que elija en la bd
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
                value: userProvider.user?.eventNotification ?? false,
                onChanged: (value) {
                  // TODO: Guardar el cambio del switch
                }
              ),
              SwitchListTile(
                title: Text('Deseo recibir notificaciones sobre promociones', style: textStyle),
                value: userProvider.user?.promotionsNotification ?? false,
                onChanged: (value) {
                  // TODO: Guardar el cambio del switch
                }
              ),
              SwitchListTile(
                title: Text('Deseo recibir notificaciones vía correo electrónico', style: textStyle),
                value: userProvider.user?.emailNotification ?? false,
                onChanged: (value) {
                  // TODO: Guardar el cambio del switch
                }
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
            children: userProvider.user?.interests.map(
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
                        onPressed: () {
                          // TODO: Quitar de la lista
                        }, 
                      )
                    ],
                  ),
                ),
              ),
            ).toList()
            ??
            []
          ),
        ),
         _CustomTextFormField(
          prefix: Text('Añadir: ', style: TextStyle(color: colors.secondary, fontSize: responsive.ip(1.4)),), 
          onFieldSubmitted: (value) {
            // TODO: Agregar a la lista de intereses
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
          onChanged: (value) {
            // TODO: Almacenar el valor en una variable
          },
          validator: (value) {
            // TODO: Validar el campo
          },
        ),
        _CustomTextFormField(
          readOnly: true,
          label: 'Correo electrónico',
          initialValue: userProvider.user?.email,
        ),
        _CustomTextFormField(
          label: 'Teléfono',
          initialValue: userProvider.user?.phone,
          keyboardType: TextInputType.phone,
          onChanged: (value) {
            // TODO: Almacenar el valor en una variable
          },
          validator: (value) {
            // TODO: Validar el campo
          },
        ),
        _CustomTextFormField(
          readOnly: true,
          label: 'Fecha de Nacimiento',
          initialValue: userProvider.user?.birthdate,
          onTap: () {
            // TODO: Abrir el calendario para que seleccione la fecha
          },
          onChanged: (value) {
            // TODO: Almacenar el valor seleccionado en el calendario
          },
        ),
        _CustomTextFormField(
          label: 'País',
          initialValue: userProvider.user?.country,
          onChanged: (value) {
            // TODO: Almacenar el valor seleccionado en el calendario
          },
          validator: (value) {
            // TODO: Validar el campo
          },
        ),
        _CustomTextFormField(
          readOnly: true,
          label: 'Estado o Provincia',
          initialValue: userProvider.user?.province,
          onChanged: (value) {
            // TODO: Almacenar el valor seleccionado en el calendario
          },
          validator: (value) {
            // TODO: Validar el campo
          },
          onTap: () {
            // TODO: Mostrar un snackbar
          },
        ),
        _CustomTextFormField(
          readOnly: true,
          label: 'Ciudad',
          initialValue: userProvider.user?.city,
          onChanged: (value) {
            // TODO: Almacenar el valor seleccionado en el calendario
          },
          validator: (value) {
            // TODO: Validar el campo
          },
          onTap: () {
            // TODO: Mostrar un snackbar
            print('object');
          },
        ),
      ],
    );
  }
}

class _CustomTextFormField extends StatelessWidget {
  final Widget? prefix;
  final String? label;
  final String? initialValue;
  final bool readOnly;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final VoidCallback? onTap;

  const _CustomTextFormField({
    this.prefix,
    this.label,
    this.initialValue,
    this.readOnly = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap
    });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Padding(
      padding: EdgeInsets.only(left: responsive.wp(10), bottom: responsive.hp(1.5)),
      child: SizedBox(
        child: TextFormField(
          initialValue: initialValue,
          style: TextStyle(color: Colors.black87, fontSize: responsive.ip(1.5)),
          autocorrect: false,
          readOnly: readOnly,
          keyboardType: keyboardType,
          textAlignVertical: TextAlignVertical.bottom,
          textCapitalization: keyboardType == TextInputType.name ? TextCapitalization.words : TextCapitalization.none,
          decoration: InputDecoration(
            filled: false,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
            ),
            prefixIconConstraints: const BoxConstraints(maxHeight: double.maxFinite),
            prefixIcon: prefix,
            labelText: label,
          ),
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
        ),
      ),
    );
  }
}