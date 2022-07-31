import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../colors/color_manager.dart';
import '../text_theme.dart';

class TextThemeLight implements ITextTheme {
  @override
  late final TextTheme data;

  @override
  late final TextStyle? headline4;

  @override
  late final GoogleFonts? fontFamily;

  @override
  TextStyle? headline1 = const TextStyle(fontSize: 32, fontWeight: FontWeight.w800);

  @override
  TextStyle? headline2 = const TextStyle(fontSize: 22, fontWeight: FontWeight.w800);

  @override
  TextStyle? headline3 = const TextStyle(fontSize: 18, fontWeight: FontWeight.w800);

  @override
  TextStyle? headline5 = const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800);

  @override
  TextStyle? headline6 = const TextStyle(fontSize: 20, fontWeight: FontWeight.normal);

  @override
  TextStyle? subtitle1 = const TextStyle(fontSize: 16.0);

  @override
  TextStyle? subtitle2 = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600);

  @override
  TextStyle? bodyText1 = const TextStyle(fontSize: 12.0);

  @override
  TextStyle? bodyText2 = const TextStyle(fontSize: 10.0);

  @override
  final Color? primaryColor;

  TextThemeLight(this.primaryColor, {IColors? colorTheme}) {
    subtitle1 = subtitle1?.apply(color: colorTheme?.colors.mediumGrey);
    subtitle2 = subtitle2?.apply(color: colorTheme?.colors.mediumGrey);
    headline5 = headline5?.apply(color: colorTheme?.colors.mediumGrey);
    headline3 = headline3?.apply(color: colorTheme?.colors.mediumGrey);
    data = TextTheme(
            headline6: headline6,
            headline2: headline2,
            subtitle1: subtitle1,
            subtitle2: subtitle2,
            headline3: headline3,
            bodyText2: bodyText2,
            bodyText1: bodyText1,
            headline1: headline1,
            headline5: headline5)
        .apply(
      displayColor: primaryColor,
    );
  }
}
