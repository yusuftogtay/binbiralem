import 'package:flutter/material.dart';

import '../../constants/enum/AppThemeEnum.dart';
import '../theme/light/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance!.theme;

  AppThemeEnum _currentThemeEnum = AppThemeEnum.LIGHT;

  // Application Theme Enum.
  // The default value is [AppThemes.LIGHT]
  AppThemeEnum get currentThemeEnum => _currentThemeEnum;

  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemeEnum theme) {
    if (theme == AppThemeEnum.LIGHT) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }

  // Change your app theme with [currentThemeEnum] value.
  void changeTheme() {
    if (_currentThemeEnum == AppThemeEnum.LIGHT) {
      _currentTheme = ThemeData.dark();
      _currentThemeEnum = AppThemeEnum.DARK;
    } else {
      _currentTheme = AppThemeLight.instance!.theme;
      _currentThemeEnum = AppThemeEnum.LIGHT;
    }
  }

  notifyListeners();
}
