import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightMode = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepOrange, brightness: Brightness.light),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 5,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: TextStyle(
        color: Colors.grey,
      ),
    ),
    highlightColor: Colors.black26,
  );
  static ThemeData darkMode = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepOrange, brightness: Brightness.dark),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black26),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 5,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: TextStyle(
        color: Colors.grey,
      ),
    ),
    highlightColor: Colors.deepOrange,
    splashColor: Colors.deepOrange,
    primaryColor: Colors.deepOrange,
  );
}
