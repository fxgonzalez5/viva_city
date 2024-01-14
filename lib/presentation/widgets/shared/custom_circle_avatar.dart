import 'dart:io';

import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final double radius;
  final EdgeInsets? margin;
  final String? imagePath;
  final Color? strokeColor;
  final double? strokeWidth;

  const CustomCircleAvatar({
    super.key,
    this.radius = 50,
    this.margin,
    this.imagePath,
    this.strokeColor,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: radius,
      height: radius,
      margin:  margin,
      decoration: BoxDecoration(
        image: imagePath != null
        ? imagePath!.startsWith('https:') 
          ? DecorationImage(image: NetworkImage(imagePath!), fit: BoxFit.contain)
          : DecorationImage(image: FileImage(File(imagePath!)), fit: BoxFit.cover)
        : const DecorationImage(image: AssetImage('assets/images/no_photo.png'), fit: BoxFit.cover),
        shape: BoxShape.circle,
        border: strokeWidth != null 
        ? Border.all(
            color: strokeColor == null ? colors.primary : strokeColor!,
            width: strokeWidth!
          )
        : null
      ),
    );
  }
}