import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';

import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/domain/entities/entities.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class EventScreen extends StatelessWidget {
  static const String name = 'event_screen'; 
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final event = GoRouterState.of(context).extra! as Event;
    final texts = Theme.of(context).textTheme;
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          SubcategoryHeader(
            title: event.titulo,
            hasRating: false,
            items: event.etiquetas,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(7)),
            sliver: SliverToBoxAdapter(
              child: Text(event.descripcion, style: texts.bodyLarge),
            ),
          ),
          _CustomCarouselSlider(event.imagenes),
          _InfoContainer(event),
          SliverList.list(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(responsive.wp(7), responsive.hp(3.5), responsive.wp(7), responsive.hp(1)),
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

class _InfoContainer extends StatelessWidget {
  final Event event;

  const _InfoContainer(this.event);


  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: responsive.wp(7)),
        padding: EdgeInsets.symmetric(vertical: responsive.hp(2), horizontal: responsive.wp(6)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(responsive.ip(1)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lugar: ${event.lugar}', style: texts.bodyLarge!.copyWith(color: colors.primary)),
            SizedBox(height: responsive.hp(1)),
            Text('Hora: ${event.hora}', style: texts.bodyLarge!.copyWith(color: colors.primary),),
            SizedBox(height: responsive.hp(1)),
            Text('Público: ${event.publico}', style: texts.bodyLarge!.copyWith(color: colors.primary)),
            SizedBox(height: responsive.hp(1)),
            Text('Organizador: ${event.organizador}', style: texts.bodyLarge!.copyWith(color: colors.primary)),
            SizedBox(height: responsive.hp(1)),
            Text('Valor: ${event.valor.toStringAsFixed(2)}\$', style: texts.bodyLarge!.copyWith(color: colors.primary)),
            SizedBox(height: responsive.hp(1)),
            Text('Cómo llegar: ${event.ubicacion}', style: texts.bodyLarge!.copyWith(color: colors.primary)),
            SizedBox(height: responsive.hp(2)), 
            Center(
              child: CustomElevatedButton(
                padding: EdgeInsets.symmetric(horizontal: responsive.wp(3)),
                text: 'COMPRAR TICKETS',
                onPressed: () {
                  // TODO: Redireccionar a una página externa
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CustomCarouselSlider extends StatelessWidget {
  final List<String> images;

  const _CustomCarouselSlider(this.images);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: responsive.hp(3)),
      sliver: SliverToBoxAdapter(
        child: CarouselSlider(
            items: List.generate(images.length, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: responsive.wp(1.5)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(responsive.ip(1)),
                  child: Image.network(images[index], fit: BoxFit.cover, width: double.infinity,),
                ),
              );
            }),
            options: CarouselOptions(
              height: responsive.hp(18),
              viewportFraction: 0.55,
              enlargeCenterPage: true,
            )
          ),
      ),
    );
  }
}