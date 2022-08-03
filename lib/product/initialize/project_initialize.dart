import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salus/product/initialize/language_initialize.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:salus/product/state/product_provider.dart';
import '../../firebase_options.dart';

abstract class IProjectInitialize {
  IProjectInitialize(this.languageInitialize, this.productProvider);
  Future<void> setup();
  final ILanguageInitialize languageInitialize;
  final ProductProvider productProvider;
}

class ProjectInitialize implements IProjectInitialize {
  @override
  final ILanguageInitialize languageInitialize = LanguageInitialize();

  @override
  Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [];
  }

  @override
  ProductProvider get productProvider => ProductProvider();
}
