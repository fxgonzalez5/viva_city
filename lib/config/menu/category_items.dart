class CategoryItem {
  final String image;
  final String name;
  final String title;
  final List<SubcategoryItem> subcategories;
  final String route;

  const CategoryItem({
    required this.image,
    required this.name,
    required this.title,
    required this.subcategories,
    required this.route,
  });
}

class SubcategoryItem {
  final String image;
  final String name;

  const SubcategoryItem({
    required this.image,
    required this.name,
  });
}

const List<CategoryItem> categoryItems = [
  CategoryItem(
    image: 'assets/images/category1.png',
    name: 'EVENTOS',
    title: 'Próximos eventos',
    subcategories: [
      SubcategoryItem(
        image: 'assets/images/subcategory_event1.jpg',
        name: 'TEATRO',
      ),
      SubcategoryItem(
        image: 'assets/images/subcategory_event2.jpg',
        name: 'CAMINATAS',
      ),
      SubcategoryItem(
        image: 'assets/images/subcategory_event3.jpg',
        name: 'PRESENTACIONES',
      ),
    ],
    route: '/event'
  ),
  
  CategoryItem(
    image: 'assets/images/category2.png',
    name: 'LUGARES',
    title: 'Lugares destacados',
    subcategories: [
      SubcategoryItem(
        image: 'assets/images/subcategory_place1.jpg',
        name: 'MUSEOS',
      ),
      SubcategoryItem(
        image: 'assets/images/subcategory_place2.jpg',
        name: 'PARQUES/PLAZAS',
      ),
      SubcategoryItem(
        image: 'assets/images/subcategory_place3.jpg',
        name: 'IGLESIAS',
      ),
    ],
    route: '/place'
  ),
  
  CategoryItem(
    image: 'assets/images/category3.png',
    name: 'HOSPEDAJE',
    title: 'Recomendados para ti',
    subcategories: [
      SubcategoryItem(
        image: 'assets/images/subcategory_lodging1.jpg',
        name: 'HOTELES',
      ),
      SubcategoryItem(
        image: 'assets/images/subcategory_lodging2.jpg',
        name: 'HOSTALES',
      ),
      SubcategoryItem(
        image: 'assets/images/subcategory_lodging3.jpg',
        name: 'HOSTERIAS',
      ),
    ],
    route: '/lodging'
  ),
];