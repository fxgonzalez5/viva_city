import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';

class MenuDivider extends StatelessWidget {
  const MenuDivider({
    super.key,
   
  });
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Divider(
      indent: responsive.wp(14),
      endIndent: responsive.wp(25),
      color: Color(0xffE5A000),
      thickness: responsive.ip(0.08),
    );
  }
}