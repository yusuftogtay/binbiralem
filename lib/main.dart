import 'package:binbiralem/core/constants/app/app_constants.dart';
import 'package:binbiralem/core/init/locale/locale_manager.dart';
import 'package:binbiralem/core/init/notifier/provider_list.dart';
import 'package:binbiralem/core/init/notifier/theme_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await _init();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance!.dependItems,],
    child: EasyLocalization(
      child: MyApp(),
      supportedLocales: LocaleManager.instance!.supportedLocales,
      path: ApplicationConstants.LOCALE_ASSET_PATH,
      startLocale: LocaleManager.instance!.enLocale,
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
