import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

mixin ErrorMixin {
  void showError(dynamic message) {
    if (kDebugMode) {
      Logger().e(message);
    }
  }

  void showDebugLog(dynamic message) {
    if (kDebugMode) {
      log('$message');
    }
  }
}
