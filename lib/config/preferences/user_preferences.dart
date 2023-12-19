import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _prefs;

  static bool _fisrtTime = true;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get firstTime => _prefs.getBool('firstTime') ?? _fisrtTime;
  static set firstTime (bool value) {
    _fisrtTime = value;
    _prefs.setBool('firstTime', value);
  }

}
