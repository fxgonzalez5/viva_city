import 'package:flutter/material.dart';
import 'package:viva_city/config/menu/category_items.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: categoryItems.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard(
                  category: categoryItems[index].category,
                  imageUrl: categoryItems[index].image,);
              },
            ),
          ),
        ],
      ),
    );
  }
}
