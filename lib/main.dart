import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/constants/app/ApplicationConstant.dart';
import 'core/init/language/LanguageManager.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';

Future<void> main() async {
  await _init();
  runApp(MultiProvider(
    providers: [
      ...ApplicationProvider.instance!.dependItems,
    ],
    child: EasyLocalization(
      child: MyApp(),
      supportedLocales: LanguageManager.instance!.supportedLocales,
      path: ApplicationConstant.LOCALE_ASSET_PATH,
      startLocale: LanguageManager.instance!.enLocale,
    ),
  ));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: context.watch<ThemeNotifier>().currentTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
