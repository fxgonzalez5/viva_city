class MenuItem {
  final String image;
  final String category;

  const MenuItem({
    required this.image,
    required this.category,
  });
}

const List<MenuItem> menuItems = [
  MenuItem(
    image: 'assets/images/viva_menu.png',
    category: 'Acerca de'
  ),
  
  MenuItem(
    image: 'assets/images/lenguaje_menu.png',
    category: 'Lenguajes'
  ),
  
  MenuItem(
    image: 'assets/images/moneda_menu.png',
    category: 'Moneda'
  ),

  MenuItem(
    image: 'assets/images/estadovias_menu.png',
    category: 'Estado de vías'
  ),

  MenuItem(
    image: 'assets/images/informaciong_menu.png',
    category: 'Información general'
  ),

];
const List<MenuItem> menuItems2 = [
  MenuItem(
    image: 'assets/images/t_uso_menu.png',
    category: 'Términos de uso'
  ),
  
  MenuItem(
    image: 'assets/images/p_privacidad_menu.png',
    category: 'Politica de privacidad'
  )
];