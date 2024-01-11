import 'package:flutter/material.dart';
import 'package:viva_city/infrastructure/models/models.dart';

class ProfileProvider extends ChangeNotifier {
  UserModel? user;
  List<int> expanded = [];
  bool isActiveNotification1 = false;
  bool isActiveNotification2 = false;
  bool isActiveNotification3 = false;
  bool _isValidNumber = false;

  void addExpanded(int value) {
    expanded.add(value);
    notifyListeners();
  }

  void removeExpanded(int value) {
    expanded.remove(value);
    notifyListeners();
  }
  
  void clearExpanded() {
    expanded.clear();
    notifyListeners();
  }

  bool get isValidNumber => _isValidNumber;
  set isValidNumber(bool value) {
    _isValidNumber = value;
    notifyListeners();
  }
}