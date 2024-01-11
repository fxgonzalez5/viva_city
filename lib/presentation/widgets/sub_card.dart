import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';

class SubCardItems extends StatelessWidget {
  final String image;
  final String category;
  final String tipo;
  final String ubi;
  final String distance;
  final String description;
  final VoidCallback? onTap;

  const SubCardItems({
    super.key, required this.image, required this.category, required this.tipo, required this.ubi, required this.distance, required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: responsive.wp(5), vertical: responsive.hp(1)),
        height: responsive.hp(12),
        //width: responsive.wp(90),
        child: Row(
          children: [
            Container(
              width: responsive.wp(30),
              decoration:  BoxDecoration(
              image:  DecorationImage(image: NetworkImage(image), fit: BoxFit.fill,),
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.only(top: responsive.hp(1)),
              width: responsive.wp(55),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category, style: TextStyle(
                    fontSize: responsive.ip(1.2),
                    fontWeight: FontWeight.bold
                  ),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Text(tipo, style: TextStyle(
                    fontSize: responsive.ip(0.8),
                    color: const Color(0xffE5A000)
                  ),),
                  const Text("|", style: TextStyle(color: Color(0xff90908F)),),
                  Text(ubi, style: TextStyle(
                    color: const Color(0xff90908F), fontSize: responsive.ip(0.8)
                  ),),
                    ],
                  ),
                  Text(distance, style: TextStyle(
                    color: const Color(0xff90908F), fontSize: responsive.ip(0.8)
                  ),),
                  SizedBox(height: responsive.hp(0.5),),
                  Text(description,
                  style:TextStyle( fontSize: responsive.ip(0.85)) , )
      
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}