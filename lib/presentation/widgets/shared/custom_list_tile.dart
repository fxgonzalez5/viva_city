import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';

class CustomListTile extends StatelessWidget {
  final EdgeInsets paddingLeading;
  final IconData icon;
  final Color iconColor;
  final String label;
  final TextStyle? labelStyle;
  
  const CustomListTile({
    super.key,
    this.paddingLeading = EdgeInsets.zero,
    required this.icon,
    this.iconColor = Colors.black45,
    required this.label,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return ListTile(
      leading: Padding(
        padding: paddingLeading,
        child: Icon(icon, color: iconColor, size: responsive.ip(2.5),),
      ),
      title: Text(label, style: labelStyle ?? TextStyle(color: Colors.black45, fontSize: responsive.ip(1.5))),
      onTap: () {
        // TODO: Implementar la naveación a las diferentes pantallas
      },
    );
  }
}