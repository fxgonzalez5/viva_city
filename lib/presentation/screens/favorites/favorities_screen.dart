import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viva_city/config/menu/list_items.dart';
import 'package:viva_city/config/theme/custom_icons.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';


class FavoritesScreen extends StatelessWidget {
  static const String name = 'favorites_screen';

  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Head(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: SearchBar(
            hintText: '¿Qué quieres hacer hoy?',
            onSubmitted: (value) {
              // TODO: Reliazar la consulta en los favoritos del usuario
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(responsive.wp(5), responsive.hp(2), responsive.wp(5), responsive.hp(1.5)),
          child: Text('Recomendado para ti', style: texts.titleLarge),
        ),
        const RecommendationList(items: [],),
        const _AgendaHeader(),
        const SubcategoryList(items: listItems)
      ],
    );
  }
}

class _AgendaHeader extends StatelessWidget {
  const _AgendaHeader();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsive.hp(1), horizontal: responsive.wp(5)),
      child: Row(
        children: [
          Text('Mi agenda', style: texts.titleLarge),
          const Spacer(),
          IconButton(
            visualDensity: VisualDensity.compact,
            highlightColor: Colors.transparent,
            icon: Icon(CustomIcons.calendar, color: colors.primary),
            onPressed: () {
              // TODO: Abrir calendario para seleccionar una fecha
            }, 
          ),
          SizedBox(width: responsive.wp(2),),
          IconButton(
            highlightColor: Colors.transparent,
            visualDensity: VisualDensity.compact,
            icon: Icon(CustomIcons.share, color: colors.secondary),
            onPressed: () {
              // TODO: Compartir la lista de eventos en la agenda
            }, 
          ),
        ],
      ),
    );
  }
}

class _Head extends StatelessWidget {
  const _Head();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final profileProvider = context.read<ProfileProvider>();
    final name = profileProvider.user!.name.split(' ')[0];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsive.hp(1.5), horizontal: responsive.wp(5)),
      child: Row(
        children: [
          Text('Hola, $name', style: texts.headlineSmall),
          const Spacer(),
          CustomCircleAvatar(
            imagePath: profileProvider.user!.photoUrl,
            radius: responsive.wp(10),
          ),
        ],
      ),
    );
  }
}