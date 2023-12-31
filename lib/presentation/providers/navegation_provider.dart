import 'package:flutter/material.dart';

class NavegationProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  int _currentPage = 0;

  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
    pageController.animateToPage(value, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    notifyListeners();
  }
}