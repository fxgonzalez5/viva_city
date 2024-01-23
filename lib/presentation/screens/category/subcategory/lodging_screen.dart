import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/domain/entities/entities.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class LodgingScreen extends StatelessWidget {
  static const String name = 'lodging_screen'; 
  const LodgingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lodging = GoRouterState.of(context).extra! as Lodging;
    final texts = Theme.of(context).textTheme;
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(imageUrl: lodging.portada,),
          SubcategoryHeader(
            title: lodging.titulo,
            score: lodging.calificacion,
          ),
           _Body(lodging),
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
              text: 'RESERVAR',
              onPressed: () {
                // TODO: Redireccionar a una página externa
              }
            ),
            const Spacer(),
            TextButton.icon(
              icon: const Icon(Icons.camera_alt_outlined),
              label: Text('Rec 360', style: texts.bodyLarge!.copyWith(color: colors.primary),),
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
  final Lodging lodging;
  const _Body(this.lodging);

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
            _Data(lodging),
            SizedBox(height: responsive.hp(3)),
            Text(lodging.descripcion, style: texts.bodyLarge),
            SizedBox(height: responsive.hp(3)),
            Text('Servicios / Facilidades', style: texts.bodyLarge!.copyWith(color: colors.primary)),
            Text(lodging.servicios,style: texts.bodyLarge), 
            SizedBox(height: responsive.hp(2)),
            _Gallery(lodging.imagenes)
          ],
        ),
      ),
    );
  }
}

class _Gallery extends StatelessWidget {
  final List<String> images;
  
  const _Gallery(this.images);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    
    return Wrap(
      spacing: responsive.wp(2),
      runSpacing: responsive.wp(2),
      children: List.generate(
        images.length,
        (index) => Image.network(images[index], width: responsive.wp(27), height: responsive.hp(9), fit: BoxFit.cover,))
    );
  }
}

class _Data extends StatelessWidget {
  final Lodging lodging;
  const _Data(this.lodging);

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ubicación: ${lodging.ubicacion}', style: texts.bodyLarge!.copyWith(color: colors.primary)),
        Text('Aeropuerto: ${lodging.aeropuerto}', style: texts.bodyLarge!.copyWith(color: colors.primary),),
        Text('Dirección: ${lodging.direccion}', style: texts.bodyLarge!.copyWith(color: colors.primary)),
        Text('Teléfono: ${lodging.telefono}', style: texts.bodyLarge!.copyWith(color: colors.primary)),
        Text('Celular: ${lodging.celular}', style: texts.bodyLarge!.copyWith(color: colors.primary)),
        Text('E-mail: ${lodging.correo}', style: texts.bodyLarge!.copyWith(color: colors.primary)),
        Text('Web: ${lodging.web}', style: texts.bodyLarge!.copyWith(color: colors.primary)),
      ],
    );
  }
}