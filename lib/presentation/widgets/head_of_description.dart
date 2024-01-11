import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viva_city/config/theme/custom_icons.dart';
import 'package:viva_city/config/theme/responsive.dart';

class HeadOfDescription extends StatelessWidget {
  const HeadOfDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     final data = GoRouterState.of(context).extra! as Map<dynamic, dynamic>;
    final texts = Theme.of(context).textTheme;
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Stack(
          children:[ 
            Container(
              height: responsive.hp(38),
              width: responsive.wp(100),
              decoration: const BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(image: NetworkImage('https://picsum.photos/200'), fit: BoxFit.cover),
            ),
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: responsive.wp(1), vertical: responsive.hp(4)) ,
                child: Stack(
                  children: [
                    Row(
                    children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_new), 
                    style:  ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white), iconSize: MaterialStatePropertyAll(responsive.ip(3))),),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border), 
                    style:  ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white), iconSize: MaterialStatePropertyAll(responsive.ip(3))),),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.map_outlined), 
                    style:  ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white), iconSize: MaterialStatePropertyAll(responsive.ip(3))))
                    ]     
                    )
                  ],
                ),
              ),
          ),
          ]
        ),
        SizedBox(height: responsive.hp(3),),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: responsive.wp(6), vertical: responsive.hp(1)),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Lugares>', style: TextStyle(color:colors.primary ,fontSize: responsive.ip(0.85)),),
                  Text('Plazas/Parques', style: TextStyle(color: Color(0xff0092D6), fontSize: responsive.ip(0.85)),)
                ],
              ),
              SizedBox(height:  responsive.hp(1.5),),
              Row(
                children: [
                  Text( data['title'], style: texts.headlineSmall,),
                  Spacer(),
                  IconButton(
                  highlightColor: Colors.transparent,
                   visualDensity: VisualDensity.compact,
                   icon: Icon(CustomIcons.share, color: colors.secondary),
          onPressed: () {
            // TODO: Compartir la lista de eventos en la agenda
          }, 
        )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}