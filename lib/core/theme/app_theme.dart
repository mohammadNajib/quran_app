import 'package:flutter/material.dart';

enum AppTheme {
  light("Blue Light"),
  dark("Blue Dark");

  const AppTheme(this.name);
  final String name;
}

final appThemeData = {
  AppTheme.dark: ThemeData(appBarTheme: const AppBarTheme(backgroundColor: Colors.white), brightness: Brightness.light),
  AppTheme.light: ThemeData(appBarTheme: const AppBarTheme(backgroundColor: Colors.black), brightness: Brightness.dark),
};
