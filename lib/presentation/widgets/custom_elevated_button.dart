import 'package:flutter/material.dart';

import 'package:viva_city/config/theme/responsive.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const CustomElevatedButton({
    super.key,
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
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        fixedSize: MaterialStatePropertyAll(Size(responsive.wp(40), responsive.hp(5))),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(responsive.ip(0.5))),
        ),
      ),
      child: onPressed != null
      ? Text(text, style: TextStyle(fontSize: responsive.ip(1.7), fontWeight: FontWeight.w400),)
      : const CircularProgressIndicator(color: Colors.grey, strokeWidth: 3, strokeCap: StrokeCap.round,)
    );
  }
}