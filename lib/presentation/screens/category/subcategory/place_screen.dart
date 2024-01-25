import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/domain/entities/place.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class PlaceScreen extends StatelessWidget {
  static const String name = 'place_screen'; 
  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final place = GoRouterState.of(context).extra! as Place;
    final texts = Theme.of(context).textTheme;
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          SubcategoryHeader(
            title: place.titulo,
            score: place.calificacion,
          ),
           _Body(place),
          const _Buttons(),
          SliverList.list(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(responsive.wp(7), 0, responsive.wp(7), responsive.hp(1)),
                child: Text('¿Qué tengo cerca?', style: texts.bodyLarge!.copyWith(color: colors.primary)),
              ),
              const RecommendationList(items: [],),
              SizedBox(height: responsive.hp(1)),
            ],
          )
        ],
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;

    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: responsive.hp(3), horizontal: responsive.wp(7)),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            CustomElevatedButton(
              padding: EdgeInsets.symmetric(horizontal: responsive.wp(3)),
              text: 'AGREGAR A MI RUTA',
              onPressed: () {
                // TODO: Agregar a las rutas del usuario
              }
            ),
            const Spacer(),
            TextButton.icon(
              icon: const Icon(Icons.camera_alt_outlined),
              label: Text('Ir a galería', style: texts.bodyLarge!.copyWith(color: colors.primary),),
              onPressed: (){
                // TODO: Redirijir a otra pantalla
              },
            )
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final Place place;
  const _Body(this.place);

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: responsive.wp(7)),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(place.descripcion, style: texts.bodyLarge),
            SizedBox(height: responsive.hp(3)), 
            Text('Horarios de visita', style: texts.bodyLarge!.copyWith(color: colors.primary)), 
            ...List.generate(place.horarios.length,(index)=>Text(place.horarios[index], style: texts.bodyLarge)),            
            SizedBox(height: responsive.hp(2)), 
            Text('Cómo llegar', style: texts.bodyLarge!.copyWith(color: colors.primary)),
            Text(place.ubicacion,style: texts.bodyLarge),
          ],
        ),
      ),
    );
  }
}
