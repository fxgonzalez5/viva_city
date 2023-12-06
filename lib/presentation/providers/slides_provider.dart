import 'package:flutter/material.dart';

class SlidesProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  int _currentPage = 0;

  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
    pageController.animateToPage(value, duration: const Duration(milliseconds: 300), curve: Curves.linear);
    notifyListeners();
  }
}