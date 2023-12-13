import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  int _currentSlider = 0;

  int get currentSlider => _currentSlider;
  set currentSlider(int value) {
    _currentSlider = value;
    notifyListeners();
  } 
}