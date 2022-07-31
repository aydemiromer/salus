import 'package:flutter/material.dart';
import 'package:salus/product/utils/theme/text/kind/light_text.dart';

import 'colors/color_manager.dart';
import 'text/text_theme.dart';

abstract class ITheme {
  ITextTheme get textTheme;
  IColors get colors;
}

abstract class ThemeManager {
  static ThemeData createTheme(ITheme theme) => ThemeData(
      textTheme: theme.textTheme.data,
      cardColor: theme.colors.colorScheme?.onSecondary,
      bottomAppBarColor: theme.colors.scaffoldBackgroundColor,
      tabBarTheme: TabBarTheme(
        indicator: const BoxDecoration(),
        labelColor: theme.colors.tabbarSelectedColor,
        unselectedLabelColor: theme.colors.tabbarNormalColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(12))),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: theme.colors.colors.white, backgroundColor: theme.colors.colors.mediumGreyBold),
      appBarTheme: _appBarTheme(theme),
      inputDecorationTheme: _CustomInputDecoration(theme),
      scaffoldBackgroundColor: theme.colors.scaffoldBackgroundColor,
      colorScheme: theme.colors.colorScheme);

  static AppBarTheme _appBarTheme(ITheme theme) {
    return AppBarTheme(
        foregroundColor: theme.colors.colors.appbarbg,
        titleSpacing: 50,
        titleTextStyle: const TextStyle(fontWeight: FontWeight.w800, color: Colors.black, fontSize: 18),
        backgroundColor: theme.colors.appBarColor,
        iconTheme: IconThemeData(color: theme.colors.colorScheme?.primary));
  }
}

class AppThemeLight extends ITheme {
  @override
  late final ITextTheme textTheme;

  AppThemeLight() {
    textTheme = TextThemeLight(
      colors.colors.mediumGrey,
    );
  }

  @override
  IColors get colors => LightColors();
}

class _CustomInputDecoration extends InputDecorationTheme {
  final ITheme theme;

  _CustomInputDecoration(this.theme) {
    _border = OutlineInputBorder(
      borderSide: BorderSide(color: theme.colors.colorScheme?.secondary.withOpacity(0.3) ?? Colors.black),
    );
  }

  late final OutlineInputBorder _border;

  @override
  TextStyle? get labelStyle => theme.textTheme.subtitle1?.copyWith(color: theme.colors.colorScheme?.secondary);

  @override
  InputBorder? get border => _border;
  @override
  InputBorder? get enabledBorder => _border;
  @override
  InputBorder? get focusedBorder => _border;
}
