import 'package:flutter/material.dart';

class GrayDivider extends StatelessWidget {
  final double? thickness;
  const GrayDivider({super.key, this.thickness});

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, thickness: thickness ?? 2);
  }
}
