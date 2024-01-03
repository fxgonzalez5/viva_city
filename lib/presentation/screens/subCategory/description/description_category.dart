import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viva_city/config/theme/responsive.dart';

class DescriptionCategory extends StatelessWidget {
  static const String name = 'description_category_screen'; 
  const DescriptionCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra! as Map<String, dynamic>;
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: Column(
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
                child: Stack(
                  children: [
                    Row(
                    children: [
                      Padding(padding: EdgeInsetsDirectional.symmetric(horizontal: responsive.wp(1), vertical: responsive.hp(4)) ),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_new), 
                    style:  ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white), iconSize: MaterialStatePropertyAll(responsive.ip(2.5))),),
                    SizedBox(width: responsive.wp(62),),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border), 
                    style:  ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white), iconSize: MaterialStatePropertyAll(responsive.ip(2.5))),),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.map_outlined), 
                    style:  ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white), iconSize: MaterialStatePropertyAll(responsive.ip(2.5))))
                    ]     
                    )
                  ],
                ),
            ),
            ]
          ),
          SizedBox(height: responsive.hp(3),),

          Column(
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: responsive.wp(5))),
                  Text('Lugares>', style: TextStyle(color:colors.primary ,fontSize: responsive.ip(0.85)),),
                  Text('Plazas/Parques', style: TextStyle(color: Color(0xff0092D6), fontSize: responsive.ip(0.85)),)
                ],
              ),
              SizedBox(height:  responsive.hp(1.5),),
              Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: responsive.wp(5))),
                  Text( data['title'], style: TextStyle(color: colors.primary, fontSize: responsive.ip(2.1)),),
                  
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}