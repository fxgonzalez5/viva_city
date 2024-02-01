import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/screens/screens.dart';

class CustomSliverAppBar extends StatelessWidget {

  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final object = context.watch<CategoryProvider>().currentObject;

    return SliverAppBar(
      pinned: true,
      expandedHeight: responsive.hp(35),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(object.portada, fit: BoxFit.cover,),
      ),
      actions: [
        IconButton(
          icon: Icon((object.isFavorite) ? Icons.favorite : Icons.favorite_border),
          color: (object.isFavorite) ? Colors.red : Colors.white,
          onPressed: () {
            if (object.isFavorite) {
              context.read<ProfileProvider>().favorites.remove(object);
            } else {
              context.read<ProfileProvider>().favorites.add(object);
            }
            object.isFavorite = !object.isFavorite;
            context.read<CategoryProvider>().currentObject = object;
          }
        ),
        IconButton(
          icon: const Icon(Icons.map_outlined),
          onPressed: () => context.pushNamed(LoadingScreen.name, extra: null),
        ),
      ],
    );
  }
}