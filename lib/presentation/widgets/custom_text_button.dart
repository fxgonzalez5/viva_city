import 'package:flutter/material.dart';

import 'package:viva_city/config/theme/responsive.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback? onPressed;

  const CustomTextButton({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return TextButton(
      style: const ButtonStyle(
        visualDensity: VisualDensity.compact,
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStatePropertyAll(Colors.transparent)
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: color, fontSize: responsive.ip(1.5), fontWeight: FontWeight.w400),),
    );
  }
}