import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class RecommendationList extends StatelessWidget {
  final List<dynamic> items;
  
  const RecommendationList({
    super.key,
    required this.items
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return SizedBox(
      height: responsive.hp(20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(vertical: responsive.hp(1), horizontal: responsive.wp(5),),
        itemCount: 5,
        itemBuilder: (context, index) => const RecommendationCard()
      ),
    );
  }
}

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    final decoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(responsive.ip(0.5)),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5,
        ),
      ],
    );

    return Container(
      width: responsive.wp(33),
      margin: EdgeInsets.symmetric(horizontal: responsive.wp(2)),
      padding: EdgeInsets.all(responsive.wp(2)),
      decoration: decoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              SizedBox(
                width: double.infinity,
                height: responsive.wp(23),
                child: Image.network('https://via.placeholder.com/500', fit: BoxFit.cover),
              ),
              FavoriteButton(
                icon: Icons.favorite_border,
                iconColor: Colors.grey.shade400,
                onPressed: () {
                  // TODO: Asignar el evento a la lista de favoritos del usuario
                },
              )
            ],
          ),
          SizedBox(height: responsive.hp(1)),
          Text('Exposición Fotográfica', style: TextStyle(color: colors.primary), overflow: TextOverflow.ellipsis),
          Text('310 m', style: texts.bodySmall!.copyWith(color: Colors.grey))
        ],
      ),
    );
  }
}