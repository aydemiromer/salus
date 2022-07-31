part of '../color_manager.dart';

class LightColors implements IColors {
  @override
  final _AppColors colors = _AppColors();

  @override
  ColorScheme? colorScheme;
  @override
  Color? appBarColor;

  @override
  Color? scaffoldBackgroundColor;

  @override
  Color? tabBarColor;

  @override
  Color? tabbarNormalColor;

  @override
  Color? tabbarSelectedColor;

  LightColors() {
    appBarColor = Colors.black;
    scaffoldBackgroundColor = colors.white;
    tabBarColor = colors.green;
    tabbarNormalColor = colors.darkerGrey;
    tabbarSelectedColor = colors.green;
    colorScheme = const ColorScheme.light().copyWith(
        primary: colors.darkGrey,
        onPrimary: colors.darkerGrey,
        onSecondary: colors.white,
        secondary: Colors.black,
        surface: colors.green,
        error: Colors.red,
        onBackground: colors.lightGrey,
        tertiaryContainer: Colors.blue,
        onTertiary: colors.white,
        tertiary: colors.green,
        onInverseSurface: colors.lightGrey,
        onSurface: colors.mediumGreyBold);

    brightness = Brightness.light;
  }

  @override
  Brightness? brightness;
}
