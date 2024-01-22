import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class LodgingScreen extends StatelessWidget {
  static const String name = 'lodging_screen'; 
  const LodgingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra! as Map<dynamic, dynamic>;
    final texts = Theme.of(context).textTheme;
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(imageUrl: data['image'],),
          SubcategoryHeader(
            title: data["title"],
          ),
          const _Body(),
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
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;

    const description = 'Nulla enim duis qui laborum occaecat duis laborum consequat nisi labore laborum officia. Voluptate aliquip laboris non enim velit veniam duis incididunt. Veniam et id et commodo anim. Duis magna ipsum qui nostrud voluptate ipsum consequat nulla id consequat officia consectetur.';

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: responsive.wp(7)),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Data(),
            SizedBox(height: responsive.hp(3)),
            Text(description, style: texts.bodyLarge),
            SizedBox(height: responsive.hp(3)),
            Text('Servicios / Facilidades', style: texts.bodyLarge!.copyWith(color: colors.primary)),
            Text('Commodo exercitation tempor sunt aliquip non occaecat. Quis voluptate aliqua velit excepteur fugiat sint esse consequat proident. Dolor amet et tempor dolore aliqua excepteur velit quis.',style: texts.bodyLarge), 
            SizedBox(height: responsive.hp(2)),
            _Gallery(List.generate(6, (index) => 'https://picsum.photos/id/${(index+5 * 7) }/1000'))
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
  const _Data({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ubicación: Centro Histórico', style: texts.bodyLarge!.copyWith(color: colors.primary)),
        Text('Aeropuerto: 45 minutos (Catamayo)', style: texts.bodyLarge!.copyWith(color: colors.primary),),
        Text('Dirección: Colón y 18 de Noviembre', style: texts.bodyLarge!.copyWith(color: colors.primary)),
        Text('Teléfono: (593 7) 258 3500', style: texts.bodyLarge!.copyWith(color: colors.primary)),
        Text('Celular: (593 7) 258 3500', style: texts.bodyLarge!.copyWith(color: colors.primary)),
        Text('E-mail: reservas@hotelcarrionloja.com', style: texts.bodyLarge!.copyWith(color: colors.primary)),
        Text('Web: www.hotelcarrionloja.com', style: texts.bodyLarge!.copyWith(color: colors.primary)),
      ],
    );
  }
}