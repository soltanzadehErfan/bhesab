import 'package:flutter/material.dart';

import '../utils/safe_provider.dart';
import '../theme/theme.dart';

class ThemeNotifier extends SafeProvider {
  bool _isLightTheme = false;

  bool get isDarkTheme => _isLightTheme;

  ThemeData get currentTheme => _isLightTheme ? lightTheme : darkTheme;

  IconData get themeIcon =>
      _isLightTheme ? Icons.dark_mode_rounded : Icons.light_mode_rounded;

  void toggleTheme() {
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }
}
