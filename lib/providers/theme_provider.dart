import 'package:flutter/material.dart';
import 'package:flexcorex/themes/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = AppTheme.darkTheme;

  ThemeData get currentTheme => _currentTheme;

  void changeTheme(bool isDarkMode) {
    _currentTheme = isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
    notifyListeners();
  }
}