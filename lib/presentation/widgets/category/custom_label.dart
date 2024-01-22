import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';

class CustomLabel extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const CustomLabel({
    super.key,
    required this.text,
    this.style
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.only(right: responsive.wp(2)),
      padding: EdgeInsets.symmetric(horizontal: responsive.hp(0.5)),
      decoration: BoxDecoration(
        border:  Border.all(color: colors.secondary),
        borderRadius: BorderRadius.circular(responsive.ip(0.5))
      ),
      child: Text(text, style: style ?? TextStyle(color: colors.secondary)),
    );
  }
}