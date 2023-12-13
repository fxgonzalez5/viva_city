import 'package:flutter/material.dart';

class SlidingProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  int _currentPage = 0;
  bool _hasSlid = false;

  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
    pageController.animateToPage(value, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    _hasSlid = true;
    notifyListeners();
  }

  bool get hasSlid => _hasSlid;
}