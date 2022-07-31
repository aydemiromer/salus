import 'package:flutter/material.dart';

part './kind/light_color.dart';

@immutable
class _AppColors {
  final Color white = const Color(0xffffffff);
  final Color mediumGrey = const Color(0xffa6bcd0);
  final Color mediumGreyBold = const Color(0xff748a9d);
  final Color lighterGrey = const Color(0xfff0f4f8);
  final Color lightGrey = const Color(0xffdbe2ed);
  final Color darkerGrey = const Color(0xff404e5a);
  final Color darkGrey = const Color(0xff4e5d6a);
  //salus
  final Color red = const Color(0xff851F36);
  final Color lightRed = const Color(0xffF4EBED);
  final Color appbarbg = const Color(0xffFCF9F4);
  final Color mediumGreen = const Color(0xffE7F1EE);
  final Color green = const Color(0xff029E48);
  final Color lighterGreen = const Color(0xffD8FDDB);
  final Color darkGreen = const Color(0xff004834);
  final Color yellow = const Color(0xffAC7201);
  final Color lightYellow = const Color(0xffFEF5CC);
}

abstract class IColors {
  _AppColors get colors;
  Color? scaffoldBackgroundColor;
  Color? appBarColor;
  Color? tabBarColor;
  Color? tabbarSelectedColor;
  Color? tabbarNormalColor;
  Brightness? brightness;

  ColorScheme? colorScheme;
}
