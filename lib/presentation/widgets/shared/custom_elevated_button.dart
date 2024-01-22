import 'package:flutter/material.dart';

import 'package:viva_city/config/theme/responsive.dart';

class CustomElevatedButton extends StatelessWidget {
  final EdgeInsets? padding;
  final String text;
  final double? fontSize;
  final VoidCallback? onPressed;

  const CustomElevatedButton({
    super.key,
    this.padding,
    this.fontSize,
    required this.text,
    required this.onPressed,
  });


  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:MaterialStatePropertyAll(onPressed != null ? colors.secondary : Colors.grey.withOpacity(0.80)),
        padding: MaterialStatePropertyAll(padding ?? EdgeInsets.zero),
        fixedSize: padding == null ? MaterialStatePropertyAll(Size(responsive.wp(40), responsive.hp(5))) : null,
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(responsive.ip(0.5))),
        ),
      ),
      child: onPressed != null
      ? Text(text, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w400),)
      : const CircularProgressIndicator(color: Colors.grey, strokeWidth: 3, strokeCap: StrokeCap.round,)
    );
  }
}