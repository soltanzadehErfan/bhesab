import 'package:flutter/material.dart';

import '../utils/safe_provider.dart';
import '../theme/theme.dart';

class ThemeNotifier extends SafeProvider {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  ThemeData get currentTheme => _isDarkTheme ? darkTheme : lightTheme;

  IconData get themeIcon =>
      _isDarkTheme ? Icons.light_mode_rounded : Icons.dark_mode_rounded;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
