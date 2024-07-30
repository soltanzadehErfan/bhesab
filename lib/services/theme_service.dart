import 'package:bhesab/utils/safe_provider.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ThemeNotifier extends SafeProvider {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  ThemeData get currentTheme => _isDarkTheme ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
