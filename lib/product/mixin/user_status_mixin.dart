import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/chat/cubit/chat_cubit.dart';
import '../../feature/chat/service/firebase_service.dart';
import '../init/language/locale_keys.g.dart';

// ignore: non_constant_identifier_names
mixin StateMixin<T extends StatefulWidget> on State<T> , WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    final prefs = await SharedPreferences.getInstance();

    final String? userID = prefs.getString('userUID');
    if (state == AppLifecycleState.resumed) {
      setState(() {
        ChatCubit(
          FireStoreService(FirebaseFirestore.instance),
        ).changeStatusPerson(userID.toString(), LocaleKeys.status_online.tr());
      });
    } else {
      setState(() {
        ChatCubit(
          FireStoreService(FirebaseFirestore.instance),
        ).changeStatusPerson(userID.toString(), LocaleKeys.status_offline.tr());
      });
    }
  }
}
