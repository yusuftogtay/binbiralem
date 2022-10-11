import 'package:flutter/material.dart';

import '../app_theme.dart';
import 'light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instace;
  static AppThemeLight? get instance {
    _instace ??= AppThemeLight._init();
    return _instace;
  }

  static const  _FONT_FAMILY = 'GOOGLE SANS';

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
    fontFamily: _FONT_FAMILY,
    colorScheme: _appColorScheme,
    textTheme: textTheme(),
    appBarTheme: _appBarTheme,
    inputDecorationTheme: _inputDecorationTheme,
    scaffoldBackgroundColor: _appColorScheme.background,
    floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme.copyWith(),
    buttonTheme: ThemeData.light().buttonTheme.copyWith(
      colorScheme: _appColorScheme,
    ),
    tabBarTheme: tabBarTheme,
  );

  InputDecorationTheme get _inputDecorationTheme  {
    return InputDecorationTheme(
      focusColor: Colors.black12,
      labelStyle: TextStyle(),
      fillColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      filled: true,
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.3)),
      focusedBorder: OutlineInputBorder(),
    );
  }

  AppBarTheme get _appBarTheme {
    return ThemeData.light().appBarTheme.copyWith(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black87, size: 21)
    );
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
      primary: Colors.lightGreen,
      primaryContainer: Colors.lightGreen[300],
      onPrimary: Colors.black87,
      onPrimaryContainer: Colors.black87,
      inversePrimary: Colors.orange,
      secondary: Colors.lime,
      secondaryContainer: Colors.lime[300],
      onSecondary: Colors.black87,
      onSecondaryContainer: Colors.black87,
      background: Color(0XFFFAFAFA),
      onBackground: Colors.black87,
      brightness: Brightness.light,
      error: Color(0XFFD32F2F),
      errorContainer: Colors.red[200],
      onError: Colors.white,
      onErrorContainer: Colors.white,
      surface: Colors.pink,
      onSurface: Colors.white,
      surfaceVariant: Colors.purple,
      onSurfaceVariant: Colors.white,
      onInverseSurface: Colors.white,
      tertiary: Colors.orange,
      tertiaryContainer: Colors.orange[300],
      onTertiary: Colors.black87,
      onTertiaryContainer: Colors.black87,
    );
  }

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      labelPadding: insets!.lowPaddingAll,
      labelColor: _appColorScheme.onSecondary,
      labelStyle: textThemeLight!.headline5,
      unselectedLabelColor: _appColorScheme.onSecondary.withOpacity(0.2),
    );
  }

  TextTheme textTheme() {
    return ThemeData.light().textTheme.apply(fontFamily: _FONT_FAMILY);
  }
}