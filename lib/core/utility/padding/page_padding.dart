import 'package:flutter/cupertino.dart';

import '../size/widget_size.dart';


class PagePadding extends EdgeInsets {
  const PagePadding.horizontalSymmetric() : super.symmetric(horizontal: WidgetSizes.spacingL);
  const PagePadding.horizontalHighSymmetric() : super.symmetric(horizontal: WidgetSizes.spacingXxl4);
  const PagePadding.horizontalLowSymmetric() : super.symmetric(horizontal: WidgetSizes.spacingXsMid);
  const PagePadding.horizontalVeryLowSymmetric() : super.symmetric(horizontal: WidgetSizes.spacingXxs);

  /// [EdgeInstets] value is: 20
  const PagePadding.verticalSymmetric() : super.symmetric(vertical: WidgetSizes.spacingL);

  const PagePadding.verticalHigh() : super.symmetric(vertical: WidgetSizes.spacingXxl4);
  const PagePadding.verticalVeryLowSymmetric() : super.symmetric(vertical: WidgetSizes.spacingXxs);
  const PagePadding.verticalNormalSymmetric() : super.symmetric(vertical: WidgetSizes.spacingXl);

  /// [EdgeInstets] value is: 10
  const PagePadding.verticalLowSymmetric() : super.symmetric(vertical: WidgetSizes.spacingXsMid);

  const PagePadding.horizontalLowXss() : super.symmetric(horizontal: WidgetSizes.spacingXxs + WidgetSizes.spacingXSS);

  const PagePadding.general()
      : super.only(right: WidgetSizes.spacingL, left: WidgetSizes.spacingL, top: WidgetSizes.spacingL);

  const PagePadding.allNormal() : super.all(WidgetSizes.spacingXl);
  const PagePadding.all() : super.all(WidgetSizes.spacingL);
  const PagePadding.allLow() : super.all(WidgetSizes.spacingXsMid);
  const PagePadding.allLow2x() : super.all(WidgetSizes.spacingXxs);

  const PagePadding.generalCardAll() : super.all(WidgetSizes.spacingS);
  const PagePadding.generalCardOnlyRight() : super.only(right: WidgetSizes.spacingXs);

  const PagePadding.generalIconAll() : super.all(WidgetSizes.spacingXxs);
  const PagePadding.generalCircleAll() : super.all(WidgetSizes.spacingXs);

  const PagePadding.onlyLeft() : super.only(left: WidgetSizes.spacingM);
  const PagePadding.onlyLeftLow() : super.only(left: WidgetSizes.spacingS);

  const PagePadding.onlyBottomNormal() : super.only(bottom: WidgetSizes.spacingXl);
  const PagePadding.onlyBottom() : super.only(bottom: WidgetSizes.spacingM);
  const PagePadding.onlyBottomLow() : super.only(bottom: WidgetSizes.spacingXsMid);

  const PagePadding.onlyTop() : super.only(top: WidgetSizes.spacingXsMid);
  const PagePadding.onlyTopLow() : super.only(top: WidgetSizes.spacingXxs);
  const PagePadding.onlyTopLowNormal() : super.only(top: WidgetSizes.spacingXxl3 / 2);

  const PagePadding.onlyTopNormal() : super.only(top: WidgetSizes.spacingXl);
  const PagePadding.onlyTopHigh() : super.only(top: WidgetSizes.spacingXxl3);

  const PagePadding.onlyRight() : super.only(right: WidgetSizes.spacingM);
  const PagePadding.onlyRightLow() : super.only(right: WidgetSizes.spacingXsMid);
}

extension PagePaddingExtension on PagePadding {
  SliverPadding toSliver(Widget sliver) {
    return SliverPadding(padding: this, sliver: sliver);
  }
}