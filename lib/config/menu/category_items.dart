class CategoryItem {
  final String image;
  final String category;

  const CategoryItem({
    required this.image,
    required this.category,
  });
}

const List<CategoryItem> categoryItems = [
  CategoryItem(
    image: 'assets/images/category1.png',
    category: 'EVENTOS'
  ),
  
  CategoryItem(
    image: 'assets/images/category2.png',
    category: 'LUGARES'
  ),
  
  CategoryItem(
    image: 'assets/images/category3.png',
    category: 'HOSPEDAJE'
  ),

];