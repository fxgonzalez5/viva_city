import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/screens/screens.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';


class ProfileScreen extends StatelessWidget {
  static const String name = 'profile_screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: responsive.wp(7.5)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2)),
            child: Text('Tu Perfil', style: texts.headlineSmall),
          ),
          const _UserCard(),
          const _OptionsList(),
          const _Information()
        ],
      ),
    );
  }
}

class _Information extends StatelessWidget {
  const _Information();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;
    final profileProvider = context.read<ProfileProvider>();
    final textStyle = TextStyle(color: Colors.black54, fontSize: responsive.ip(1.5));
    final expansionTileController1 = ExpansionTileController();
    final expansionTileController2 = ExpansionTileController();
    final expansionTileController3 = ExpansionTileController();
    final expansionTileController4 = ExpansionTileController();

    void collapseExpansionTiles() {
      expansionTileController1.collapse();
      expansionTileController2.collapse();
      expansionTileController3.collapse();
      expansionTileController4.collapse();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Configuración', style: texts.titleLarge),
        SizedBox(height: responsive.hp(1)),
        _CustomExpansionTile(
          controller: expansionTileController1,
          index: 1,
          leadingIcon: Icons.badge_outlined,
          title: 'Datos personales',
          children: [
            _CustomListTile(title: 'Correo electrónico', subtitle: profileProvider.user!.email),
            _CustomListTile(title: 'Teléfono', subtitle: profileProvider.user!.phone),
            _CustomListTile(title: 'Fecha de cumpleaños', subtitle: profileProvider.user!.birthdate?.timeZoneName),
          ],
        ),
        _CustomExpansionTile(
          controller: expansionTileController2,
          index: 2,
          leadingIcon: Icons.interests_outlined,
          title: 'Intereses',
          children: [
            if (profileProvider.user!.interests.isNotEmpty)
              Wrap(
                alignment: WrapAlignment.center,
                children: profileProvider.user!.interests.map(
                  (interest) => Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: responsive.wp(1.5), horizontal: responsive.wp(2)),
                      child: Text(interest, style: textStyle),
                    ),
                  )
                ).toList()
              )
            else
              Card(
                color: Colors.grey.shade200,
                surfaceTintColor: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: responsive.wp(1.5), horizontal: responsive.wp(2)),
                  child: Text('Ninguno', style: textStyle),
                ),
              ),
          ],
        ),
        _CustomExpansionTile(
          controller: expansionTileController3,
          index: 3,
          leadingIcon: Icons.notifications_outlined,
          title: 'Notificaciones',
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(right: responsive.wp(5)),
              title: Text('Deseo recibir notificaciones sobre nuevos eventos', style: textStyle),
              trailing: Icon(Icons.check_circle_outline, color: profileProvider.user!.eventNotification ? colors.secondary : Colors.grey.shade300),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(right: responsive.wp(5)),
              title: Text('Deseo recibir notificaciones sobre promociones', style: textStyle),
              trailing: Icon(Icons.check_circle_outline, color: profileProvider.user!.promotionsNotification ? colors.secondary : Colors.grey.shade300),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(right: responsive.wp(5)),
              title: Text('Deseo recibir notificaciones vía correo electrónico', style: textStyle),
              trailing: Icon(Icons.check_circle_outline, color: profileProvider.user!.emailNotification ? colors.secondary : Colors.grey.shade300),
            ),
          ],
        ),
        _CustomExpansionTile(
          controller: expansionTileController4,
          index: 4,
          leadingIcon: Icons.payments_outlined,
          title: 'Métodos de pago',
          children: [
            // TODO: Agregar los métodos de pago
          ],
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2)),
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(colors.secondary)),
              onPressed: () {
                context.pushNamed(EditProfileScreen.name); 
                profileProvider.clearExpanded();
                collapseExpansionTiles();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: responsive.wp(4)),
                child: Text('Editar', style: TextStyle(fontSize: responsive.ip(1.4))),
              )
            ),
          ),
        )
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String? subtitle;

  const _CustomListTile({
    required this.title,
    this.subtitle
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        ListTile(
          visualDensity: VisualDensity.compact,
          title: Text(title, style: TextStyle(color: colors.secondary, fontSize: responsive.ip(1.5))),
          subtitle: Text(subtitle ?? '', style: TextStyle(color: Colors.black54, fontSize: responsive.ip(1.4))),
        ),
        LineDivider(
          height: responsive.hp(0.05),
          space: 0,
          color: Colors.grey,
        ),
        SizedBox(height: responsive.hp(1.5)),
      ],
    );
  }
}

class _CustomExpansionTile extends StatelessWidget {
  final int index;
  final IconData leadingIcon;
  final String title;
  final List<Widget> children;
  final ExpansionTileController? controller;


  const _CustomExpansionTile({
    required this.index,
    required this.leadingIcon,
    required this.title,
    required this.children,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    final profileProvider = context.watch<ProfileProvider>();

    return ExpansionTile(
      controller: controller,
      expandedAlignment: Alignment.centerLeft,
      leading: Icon(leadingIcon, size: responsive.ip(2.5)),
      title: Text(title, style: TextStyle(fontSize: responsive.ip(1.7))),
      trailing: !profileProvider.expanded.contains(index)
      ? const Icon(Icons.keyboard_arrow_down_rounded)
      : DecoratedBox(
          decoration: BoxDecoration(
            color: colors.primary,
            shape: BoxShape.circle
          ),
          child: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
        ),
      children: children,
      onExpansionChanged: (bool value) {
        if (value) {
          profileProvider.addExpanded(index);
        } else {
          profileProvider.removeExpanded(index);
        }
      },
    );
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsive.hp(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mis momentos', style: texts.titleLarge),
          SizedBox(height: responsive.hp(1)),
          CustomListTile(
            icon: Icons.calendar_today_outlined,
            iconColor: Colors.black54,
            label: 'Mi agenda',
            labelStyle: TextStyle(color: Colors.black54, fontSize: responsive.ip(1.7)),
          ),
          CustomListTile(
            icon: Icons.place_outlined,
            iconColor: Colors.black54,
            label: 'Mis lugares',
            labelStyle: TextStyle(color: Colors.black54, fontSize: responsive.ip(1.7)),
          ),
          CustomListTile(
            icon: Icons.groups_outlined,
            iconColor: Colors.black54,
            label: 'Salidas en grupo',
            labelStyle: TextStyle(color: Colors.black54, fontSize: responsive.ip(1.7)),
          ),
          SizedBox(height: responsive.hp(0.5)),
          const LineDivider()
        ],
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final userProvider = context.read<ProfileProvider>();
    final residence = userProvider.user?.city != null ? '${userProvider.user!.city}, ${userProvider.user!.province}, ${userProvider.user!.country}' : 'Residencia desconocida';

    return Container(
      padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(6)),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(responsive.ip(2))
      ),
      child: Row(
        children: [
          CustomCircleAvatar(
            imagePath: userProvider.user!.photoUrl,
            radius: responsive.wp(22.5)
          ),
          SizedBox(width: responsive.wp(6)),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userProvider.user!.name, style: texts.headlineSmall!.copyWith(color: Colors.black),),
                Text(residence, style: texts.titleMedium!.copyWith(color: Colors.grey, fontWeight: FontWeight.normal),),
              ],
            ),
          )
        ],
      ),
    );
  }
}