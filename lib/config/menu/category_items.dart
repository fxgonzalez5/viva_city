class CategoryItem {
  final String image;
  final String category;
  final String title;

  const CategoryItem({
    required this.image,
    required this.category,
    required this.title,
  });
}

const List<CategoryItem> categoryItems = [
  CategoryItem(
    image: 'assets/images/category1.png',
    category: 'EVENTOS',
    title: 'Próximos eventos',
  ),
  
  CategoryItem(
    image: 'assets/images/category2.png',
    category: 'LUGARES',
    title: 'Lugares destacados',
  ),
  
  CategoryItem(
    image: 'assets/images/category3.png',
    category: 'HOSPEDAJE',
    title: 'Recomendados para ti',
  ),

];