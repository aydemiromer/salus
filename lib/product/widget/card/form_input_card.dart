import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/utility/padding/page_padding.dart';
import '../../../core/utility/size/widget_size.dart';


class FormInputCard extends StatelessWidget {
  const FormInputCard({Key? key, required this.child, this.margin}) : super(key: key);
  final Widget child;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: WidgetSizes.spacingXxs,
      margin: margin ?? context.paddingNormal,
      shape:
          const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(WidgetSizes.spacingL))),
      child: Padding(
        padding: const PagePadding.horizontalSymmetric(),
        child: child,
      ),
    );
  }
}
