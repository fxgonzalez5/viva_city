class SubCategoryItem {
  final String image;
  final String category;
  final String title;

  const SubCategoryItem({
    required this.image,
    required this.category,
    required this.title,
  });
}

const List<SubCategoryItem> subCategoryItems = [
  SubCategoryItem(
    image: 'assets/images/category1.png',
    category: 'EVENTOS',
    title: 'Próximos eventos',
  ),
  
  SubCategoryItem(
    image: 'assets/images/category2.png',
    category: 'LUGARES',
    title: 'Lugares destacados',
  ),
  
  SubCategoryItem(
    image: 'assets/images/category3.png',
    category: 'HOSPEDAJE',
    title: 'Recomendados para ti',
  ),

];