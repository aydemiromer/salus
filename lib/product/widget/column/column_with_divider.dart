import 'package:flutter/material.dart';

class ColumnWithSpacing extends StatelessWidget {
  /// Default [CrossAxisAlignment] = MainAxisAlignment.start
  /// 
  /// Default [MainAxisAlignment] = CrossAxisAlignment.center
  const ColumnWithSpacing({
    super.key,
    required this.children,
    required this.space,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
  });

  final List<Widget> children;
  final double space;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: children
          .map(
            (child) => Padding(padding: EdgeInsets.only(top: space), child: child),
          )
          .toList(),
    );
  }
}
