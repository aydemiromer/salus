import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salus/core/widget/button/custom_elevated_button.dart';
import 'package:salus/feature/chat/cubit/chat_cubit.dart';
import 'package:salus/product/init/language/locale_keys.g.dart';
import 'package:salus/product/utils/text/product_text.dart';
import 'package:salus/product/widget/appBar/app_bar_widget.dart';
import 'package:kartal/kartal.dart';

import '../service/firebase_service.dart';
part 'module/tabbar_widget.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ChatCubit(FireStoreService(FirebaseFirestore.instance))..init();
      },
      child: Scaffold(
        backgroundColor: context.colorScheme.onBackground,
        appBar: _appbar,
        body: _body(context),
      ),
    );
  }
}

AppBarWidget get _appbar => AppBarWidget();

Widget _body(BuildContext context) => BlocBuilder<ChatCubit, ChatState>(
      builder: ((context, state) => Column(
            children: [
              context.emptySizedHeightBoxLow,
              const _Tabbar(),
            ],
          )),
    );
