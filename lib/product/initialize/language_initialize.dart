import 'dart:ui';

import '../model/enums/locale_enums.dart';


abstract class ILanguageInitialize {
  List<Locale> get supportedLocales;
  String get translationsPath;
}

class LanguageInitialize implements ILanguageInitialize {
  @override
  final List<Locale> supportedLocales = [LocaleEnums.tr.item];

  @override
  final String translationsPath = 'assets/translations';
}
