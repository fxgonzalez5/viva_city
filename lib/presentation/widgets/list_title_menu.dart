
import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';

class ListTitles extends StatelessWidget {
  final String Texto;
  final String Images;
  const ListTitles({
    super.key, required this.Texto, required this.Images,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return ListTile(
      contentPadding: EdgeInsets.only(left: responsive.ip(3)),
      title:  Text(Texto, style: TextStyle(
        color: const Color(0xff808080),
        fontSize: responsive.ip(1.3)
      ),),
      minVerticalPadding: responsive.hp(1),
      minLeadingWidth: responsive.wp(12),
      leading: Image.asset(Images, width: responsive.wp(7),),
    );
  }
}