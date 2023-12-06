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
        )
      )
    )
  );
}
