import 'package:flutter/widgets.dart';
import 'package:viva_city/config/theme/custom_icons.dart';

class MenuItem {
  final IconData icon;
  final String label;
  final String? route;

  const MenuItem({
    required this.icon,
    required this.label,
    this.route,
  });
}

const List<MenuItem> menuItems = [
  MenuItem(
    icon: CustomIcons.viva_city,
    label: 'Acerca de'
  ),
  
  MenuItem(
    icon: CustomIcons.languaje,
    label: 'Lenguajes'
  ),
  
  MenuItem(
    icon: CustomIcons.coin,
    label: 'Moneda'
  ),

  MenuItem(
    icon: CustomIcons.cross_ways,
    label: 'Estado de vías'
  ),

  MenuItem(
    icon: CustomIcons.information,
    label: 'Información general'
  ),

  MenuItem(
    icon: CustomIcons.document,
    label: 'Términos de uso'
  ),
  
  MenuItem(
    icon: CustomIcons.verified_shield,
    label: 'Politica de privacidad'
  ),

  MenuItem(
    icon: CustomIcons.gear,
    label: 'Ajustes'
  ),
];