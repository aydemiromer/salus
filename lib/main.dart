import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salus/feature/landing/landing_page.dart';
import 'package:salus/product/init/language/locale_keys.g.dart';
import 'package:salus/product/initialize/project_initialize.dart';
import 'package:salus/product/utils/theme/app_theme.dart';

Future<void> main() async {
  final IProjectInitialize appInitialize = ProjectInitialize();
  await appInitialize.setup();

  runApp(MultiProvider(
    providers: appInitialize.productProvider.provider,
    child: EasyLocalization(
        path: appInitialize.languageInitialize.translationsPath,
        supportedLocales: appInitialize.languageInitialize.supportedLocales,
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: LocaleKeys.title_salus.tr(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeManager.createTheme(AppThemeLight()),
        home: const LandingPage());
  }
}
