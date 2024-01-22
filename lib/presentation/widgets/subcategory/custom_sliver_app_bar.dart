import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String imageUrl;

  const CustomSliverAppBar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return SliverAppBar(
      pinned: true,
      expandedHeight: responsive.hp(35),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(imageUrl, fit: BoxFit.cover,),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {
            // TODO: Agregar a favoritos y cambiar el color
          }
        ),
        IconButton(
          icon: const Icon(Icons.map_outlined),
          onPressed: () {
            // TODO: Redirijir al mapa en la ubicación del objeto
          }
        ),
      ],
    );
  }
}