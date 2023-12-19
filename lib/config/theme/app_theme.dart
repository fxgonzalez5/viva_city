import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';

class AppTheme {

  static const Color primary =  Color(0xff3D238E);
  static const Color secondary =  Color(0xffE5A000);
  final bool isDarkMode;

  AppTheme({
    this.isDarkMode = false,
  });

  ThemeData getTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple.shade900,
      primary: primary,
      secondary: secondary,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
    ),

    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        color: Colors.white,
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white24,
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(Responsive(context).ip(0.75))),
        borderSide: BorderSide.none
      ),             
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(Responsive(context).ip(0.75))),
        borderSide: BorderSide.none
      ),
      contentPadding: EdgeInsets.symmetric(vertical: Responsive(context).hp(1)),
      prefixIconColor: Colors.white,
      hintStyle: TextStyle(color: Colors.white, fontSize: Responsive(context).ip(1.25), fontWeight: FontWeight.w400),
      suffixIconColor: Colors.white,
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(Responsive(context).ip(0.75))),
        borderSide: BorderSide(color: secondary, width: Responsive(context).ip(0.5))
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(Responsive(context).ip(0.75))),
        borderSide: BorderSide(color: secondary, width: Responsive(context).ip(0.5))
      ),
      errorStyle: const TextStyle(color: secondary, fontWeight: FontWeight.bold)
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color(0xff262622),
      selectedItemColor: secondary,
      unselectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(
        size: Responsive(context).ip(3),
      ),
      unselectedIconTheme: IconThemeData(
        size: Responsive(context).ip(3),
      ),
      type: BottomNavigationBarType.fixed,
    ),
    
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.purple.shade900),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: Responsive(context).ip(3),
          ),
        ),
        side: const MaterialStatePropertyAll(BorderSide.none),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Responsive(context).ip(1))
          ),
        ),
      )
    ),
  );
}
