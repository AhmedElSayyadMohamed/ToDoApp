import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  primaryColor: Colors.teal,
  backgroundColor: Colors.white70,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black54,
    ),
    bodyText2: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.grey,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.grey[100],
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 7,
    selectedItemColor: Colors.teal,
  ),
  iconTheme: IconThemeData(
    color: Colors.teal,
  ),
);
ThemeData darkMode = ThemeData(
  primaryColor: Colors.indigo,
  backgroundColor: Colors.black26,
  scaffoldBackgroundColor: Colors.black12,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white70,
    ),
    bodyText2: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white38,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.black12,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black12,
    elevation: 7,
    selectedItemColor: Colors.indigo,
    unselectedItemColor: Colors.grey,
  ),
  iconTheme: IconThemeData(
    color: Colors.indigo,
  ),
);
