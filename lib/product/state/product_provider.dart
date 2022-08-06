import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:salus/feature/chat/cubit/chat_cubit.dart';
import 'package:salus/product/state/user_context.dart';

import 'firebase_user_context.dart';

@immutable
class ProductProvider {
  late final List<SingleChildWidget> provider;

  ProductProvider() {
    provider = [..._independentServices];
  }

  final List<SingleChildWidget> _independentServices = [
    Provider.value(value: UserContext()),
    Provider.value(value: FirebaseUserContext()),
   
    // Provider.value(value: ApplicationContext()),
  ];
}
