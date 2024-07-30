import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.white,
    onPrimary: Colors.blue,
    secondary: Colors.white,
    onSecondary: Colors.blue,
    error: Colors.red,
    onError: Colors.red,
    surface: Colors.white,
    onSurface: Colors.black54,
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(
        Colors.black38,
      ),
      iconColor: WidgetStatePropertyAll(Colors.purpleAccent),
    ),
  ),
  dividerTheme: const DividerThemeData(
    color: Colors.amber,
    indent: 64.0,
    endIndent: 64.0,
  ),
);

final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.white,
    onPrimary: Colors.blue,
    secondary: Colors.white,
    onSecondary: Colors.blue,
    error: Colors.red,
    onError: Colors.red,
    surface: Colors.black,
    onSurface: Colors.white54,
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(
        Colors.white38,
      ),
      iconColor: WidgetStatePropertyAll(Colors.purpleAccent),
    ),
  ),
  dividerTheme: const DividerThemeData(
    color: Colors.amber,
    indent: 64.0,
    endIndent: 64.0,
  ),
);
