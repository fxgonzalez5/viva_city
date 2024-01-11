import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  final scrollController = ScrollController();
  GlobalKey<FormState> singupFormKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String? _errorEmail;
  String password = '';
  String? _errorPassword;
  String phone = '';
  bool _isVisibleOne = false;
  bool _isVisibleTwo = false;
  bool _isValidNumber = false;
  bool _isLoading = false;

  bool isValidForm() {
    return singupFormKey.currentState?.validate() ?? false;
  }

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

  bool get isVisibleOne => _isVisibleOne;
  set isVisibleOne(bool value) {
    _isVisibleOne = value;
    notifyListeners();
  }

  bool get isVisibleTwo => _isVisibleTwo;
  set isVisibleTwo(bool value) {
    _isVisibleTwo = value;
    notifyListeners();
  }

  bool get isValidNumber => _isValidNumber;
  set isValidNumber(bool value) {
    _isValidNumber = value;
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