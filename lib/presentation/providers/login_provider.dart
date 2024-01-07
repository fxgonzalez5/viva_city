import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final scrollController = ScrollController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String? _errorEmail;
  String password = '';
  String? _errorPassword;
  bool _isVisible = false;
  bool _isLoading = false;

  String? get errorEmail => _errorEmail;
  set errorEmail(String? value) {
    _errorEmail = value;
    notifyListeners();
  }

  String? get errorPassword => _errorPassword;
  set errorPassword(String? value) {
    _errorPassword = value;
    notifyListeners();
  }

  bool get isVisible => _isVisible;
  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void moveScrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );

  }
}