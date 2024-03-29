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
    
    splashColor: Colors.transparent,

    textTheme: const TextTheme(
      headlineSmall: TextStyle(color: primary),
      titleLarge: TextStyle(color: primary),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: Responsive(context).ip(1.8),
        fontWeight: FontWeight.w500
      )
    ),

    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: Colors.white24,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(Responsive(context).ip(0.75))),
        borderSide: BorderSide.none
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(Responsive(context).ip(0.75))),
        borderSide: BorderSide.none
      ),
      prefixIconColor: Colors.white,
      labelStyle: TextStyle(color: secondary, fontSize: Responsive(context).ip(2), height: 1),
      hintStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
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

    listTileTheme: const ListTileThemeData(
      dense: true,
      contentPadding: EdgeInsets.zero
    ),

    expansionTileTheme: ExpansionTileThemeData(
      shape: const RoundedRectangleBorder(),
      iconColor: Colors.black,
      childrenPadding: EdgeInsets.only(left: Responsive(context).wp(10))
    ),

    switchTheme: SwitchThemeData(
      thumbColor: MaterialStatePropertyAll(secondary.withOpacity(0.85)),
      trackOutlineColor: MaterialStatePropertyAll(primary.withOpacity(0.75)),
      trackColor: MaterialStatePropertyAll(primary.withOpacity(0.5)),
    ),

    dividerTheme: DividerThemeData(
      space: Responsive(context).hp(0.5),
      thickness: Responsive(context).hp(0.1),
      color: secondary
    ),

    cardTheme: CardTheme(
      elevation: 0,
      color: secondary.withOpacity(0.25),
      surfaceTintColor: secondary,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Responsive(context).ip(0.5)),
      )
    ),

    searchBarTheme: SearchBarThemeData(
      constraints: BoxConstraints.expand(width: double.infinity, height: Responsive(context).hp(4.5)),
      backgroundColor: MaterialStatePropertyAll(Colors.grey.shade200),
      elevation: const MaterialStatePropertyAll(0),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Responsive(context).ip(1)),
        ),
      ),
      hintStyle: const MaterialStatePropertyAll(TextStyle(color: Colors.black54))
    ),
  );
}
