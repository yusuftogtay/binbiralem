import 'package:flutter/material.dart';

class LocaleManager {
  static LocaleManager? _instace;
  static LocaleManager? get instance {
    _instace ??= LocaleManager._init();
    return _instace;
  }

  LocaleManager._init();

  final enLocale = Locale('en', 'US');
  final trLocale = Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale];

}