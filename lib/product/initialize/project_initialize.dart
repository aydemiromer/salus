import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salus/product/initialize/language_initialize.dart';

abstract class IProjectInitialize {
  IProjectInitialize(this.languageInitialize);
  Future<void> setup();
  final ILanguageInitialize languageInitialize;
}

class ProjectInitialize implements IProjectInitialize {
  @override
  final ILanguageInitialize languageInitialize = LanguageInitialize();

  @override
  Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [];
  }
}
