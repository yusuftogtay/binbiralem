import 'package:flutter/material.dart';

import '../../constants/enum/app_theme_enum.dart';
import '../theme/light/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance!.theme;

  AppThemes _currentThemeEnum = AppThemes.LIGHT;

  // Application Theme Enum.
  // The default value is [AppThemes.LIGHT]
  AppThemes get currentThemeEnum => _currentThemeEnum;

  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT)  {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }

  // Change your app theme with [currentThemeEnum] value.
  void changeTheme()  {
    if (_currentThemeEnum == AppThemes.LIGHT) {
      _currentTheme = ThemeData.dark();
      _currentThemeEnum = AppThemes.DARK;
    } else {
      _currentTheme = AppThemeLight.instance!.theme;
      _currentThemeEnum = AppThemes.LIGHT;
    }
  }
  notifyListeners();
}