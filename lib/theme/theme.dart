import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  ThemeData get currentTheme => _isDarkTheme ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}

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
  iconTheme: const IconThemeData(
    color: Colors.black54,
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
  iconTheme: const IconThemeData(
    color: Colors.white54,
  ),
);
