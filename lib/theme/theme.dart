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
    onSurface: Colors.black,
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(
        Colors.black26,
      ),
      iconColor: WidgetStatePropertyAll(Colors.purpleAccent),
    ),
  ),
  dividerTheme: const DividerThemeData(
    color: Colors.amber,
    indent: 64.0,
    endIndent: 64.0,
  ),
  iconTheme: const IconThemeData(
    color: Colors.black54,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.purple),
    ),
    labelStyle: TextStyle(color: Colors.deepPurple),
  ),
  snackBarTheme: const SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
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
    onSurface: Colors.white,
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(
        Colors.white24,
      ),
      iconColor: WidgetStatePropertyAll(Colors.purpleAccent),
    ),
  ),
  dividerTheme: const DividerThemeData(
    color: Colors.amber,
    indent: 64.0,
    endIndent: 64.0,
  ),
  iconTheme: const IconThemeData(
    color: Colors.white54,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.purple),
    ),
    labelStyle: TextStyle(color: Colors.deepPurple),
  ),
  snackBarTheme: const SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
  ),
);
