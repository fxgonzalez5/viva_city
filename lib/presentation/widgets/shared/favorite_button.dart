import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';

class FavoriteButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onPressed;

  const FavoriteButton({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    
    return Container(
      width: responsive.ip(2.25),
      height: responsive.ip(2.25),
      margin: EdgeInsets.all(responsive.ip(0.5)),
      decoration: BoxDecoration(
        color: (onPressed != null) ? Colors.white : Colors.grey,
        shape: BoxShape.circle
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon),
        iconSize: responsive.ip(1.5),
        color: iconColor,
        onPressed: onPressed,
      ),
    );
  }
}