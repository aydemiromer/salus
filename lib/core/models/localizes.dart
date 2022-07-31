import 'package:flutter/material.dart';

enum Localizes { tr, en }

extension LocalizesExtension on Localizes {
  Locale get value {
    switch (this) {
      case Localizes.tr:
        return const Locale('tr', 'TR');
      case Localizes.en:
        return const Locale('en', 'US');
    }
  }
}
