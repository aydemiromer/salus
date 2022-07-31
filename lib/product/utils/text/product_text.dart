import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/utility/constants.dart';
import 'style_text.dart';

class ProductText extends Text {
  const ProductText(String data, [Key? key]) : super(data, key: key);

  /// Default headline 1
  ///
  /// [fontSize]: 32, [fontWeight]: FontWeight.w800
  ProductText.headline1(String data, {Key? key, required BuildContext context, Color? color})
      : super(data, key: key, style: context.textTheme.headline1?.copyWith(color: color));

  /// Default headline 2
  ///
  /// [fontSize]: 22, [fontWeight]: FontWeight.w800
  ProductText.headline2(String data, {Key? key, required BuildContext context, int? maxLine, Color? color})
      : super(
          data,
          key: key,
          style: context.textTheme.headline2?.copyWith(color: color),
          maxLines: maxLine ?? kOne.toInt(),
          overflow: TextOverflow.ellipsis,
        );

  /// Custom headline3
  ///
  /// [fontSize]: 18, [fontWeight]: W800, [color]: secondary
  ProductText.headline3(
    String data, {
    required BuildContext context,
    Key? key,
    int? maxLine,
    bool? underLine,
    Color? color,
    TextAlign? textAlign,
  }) : super(data,
            key: key,
            style: context.textTheme.headline3?.copyWith(
              decoration: (underLine ?? false) ? TextDecoration.underline : null,
              color: color,
            ),
            maxLines: maxLine,
            textAlign: textAlign);

  /// Custom headline3
  ///
  /// color: secondary
  ProductText.headline3Secondary(String data, {Key? key, required BuildContext context})
      : super(data, key: key, style: context.textTheme.headline3?.copyWith(color: context.colorScheme.secondary));

  /// Custom headline3
  ///
  /// [fontSize]: 18, Default [FontWeight]: FontWeight.w600 [color]: secondary
  ProductText.normalGreyWithBoldOption(
    String data, {
    Key? key,
    required BuildContext context,
    FontWeight? fontWeight,
  }) : super(
          data,
          key: key,
          style: context.textTheme.headline3?.copyWith(
            color: context.colorScheme.secondary,
            fontWeight: fontWeight ?? FontWeight.w600,
          ),
        );

  /// Default headline5
  ///
  /// [fontSize]: 16.0, [fontWeight]: FontWeight.w800
  ProductText.headline5(String data,
      {Key? key, required BuildContext context, FontWeight? fontWeight, TextAlign? textAlign, int maxLine = 2})
      : super(data,
            key: key,
            style: context.textTheme.headline5?.copyWith(
              fontWeight: fontWeight ?? FontWeight.w900,
            ),
            textAlign: textAlign,
            maxLines: maxLine);

  /// headline5 with extra font weight option
  ///
  /// [fontSize]: 16.0, [fontWeight]: FontWeight.w800
  ProductText.headline5WithBoldOption(
    String data, {
    Key? key,
    required BuildContext context,
    FontWeight? fontWeight,
  }) : super(data, key: key, style: context.textTheme.headline5?.copyWith(fontWeight: fontWeight));

  /// Headline5 with grey
  ///
  /// [color]: secondary
  ProductText.headline5Grey(String data,
      {Key? key, required BuildContext context, Color? color, int? maxLine = 2, FontWeight? weight})
      : super(data,
            maxLines: maxLine,
            overflow: TextOverflow.ellipsis,
            key: key,
            style: context.textTheme.headline5
                ?.copyWith(color: color ?? context.colorScheme.secondary, fontWeight: weight));

  /// W700 font weight and 16 font size with onPrimary color
  ProductText.semiBoldNormal(String data,
      {Key? key,
      required BuildContext context,
      Color? color,
      int? maxLine = 2,
      TextOverflow overflow = TextOverflow.ellipsis})
      : super(data,
            key: key,
            maxLines: maxLine,
            overflow: overflow,
            style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.w700, color: color));

  /// Default subtitle1
  ///
  /// [fontSize]: 16.0
  ProductText.subtitle1(
    String data, {
    Key? key,
    required BuildContext context,
    Color? color,
    FontWeight? fontWeight,
  }) : super(
          data,
          key: key,
          style: context.textTheme.subtitle1?.copyWith(
            color: color,
            fontWeight: fontWeight,
          ),
        );

  /// Custom subtitle2
  ///
  /// [fontSize]: 14.0, [fontWeight]: FontWeight.bold, [color]: onPrimary
  ProductText.subtitle2NormalBold(
    String data, {
    Key? key,
    required BuildContext context,
    TextStyle? textStyle,
    Color? color,
    int? maxLines,
  }) : super(
          data,
          maxLines: maxLines,
          key: key,
          style: textStyle ??
              context.textTheme.subtitle2?.copyWith(
                fontWeight: FontWeight.bold,
                color: color ?? context.colorScheme.onPrimary,
              ),
        );

  /// Custom subtitle2
  ///
  /// fontSize: 14.0, [fontWeight]: FontWeight.w600,  [color]: secondary
  ProductText.subtitle2Grey(String data, {Key? key, required BuildContext context, FontWeight? weight})
      : super(
          data,
          key: key,
          style: context.textTheme.subtitle2?.copyWith(
            color: context.colorScheme.secondary,
            fontWeight: weight,
          ),
        );

  ProductText.bodyText1Primary(String data, {Key? key, required BuildContext context})
      : super(
          data,
          key: key,
          style: context.textTheme.bodyText1?.copyWith(color: context.colorScheme.primary),
        );
}

extension ProductTextExtension on ProductText {
  Text get overflowMax {
    return Text(data ?? '', style: style, maxLines: StyleText.maxLine, overflow: TextOverflow.ellipsis);
  }

  Text underLine(bool isEnabled) {
    return Text(data ?? '', style: style?.copyWith(decoration: isEnabled ? TextDecoration.underline : null));
  }

  Text align({TextAlign? textAlign}) {
    return Text(data ?? '', textAlign: textAlign, style: style);
  }

  Text color(Color? color) {
    return Text(data ?? '', style: style?.copyWith(color: color));
  }

  Text maxLine({required int maxLine}) {
    return Text(data ?? '', maxLines: maxLines, overflow: TextOverflow.ellipsis, style: style);
  }

  Text fontWeight({required FontWeight weight}) {
    return Text(data ?? '', style: style?.copyWith(fontWeight: weight));
  }

  Text get overFlow {
    return Text(data ?? '', style: style?.copyWith(overflow: TextOverflow.ellipsis));
  }

  Text fontSize({double? fontSize}) {
    return Text(data ?? '', style: style?.copyWith(fontSize: fontSize));
  }
}
