import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salus/core/utility/padding/page_padding.dart';
import 'package:salus/core/widget/button/custom_elevated_button.dart';
import 'package:salus/feature/chat/cubit/chat_cubit.dart';
import 'package:salus/feature/chat/view/chat_detail_view.dart';
import 'package:salus/product/init/language/locale_keys.g.dart';
import 'package:salus/product/mixin/user_status_mixin.dart';
import 'package:salus/product/utils/text/product_text.dart';
import 'package:salus/product/widget/appBar/app_bar_widget.dart';
import 'package:kartal/kartal.dart';
import 'package:salus/product/widget/column/column_with_divider.dart';
import 'package:salus/product/widget/divider/gray_divider.dart';

import '../../../product/model/user/user_model.dart';
import '../service/Ifirebase_service.dart';
import '../service/firebase_service.dart';
part 'module/tabbar_widget.dart';
part 'module/users_widget.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> with WidgetsBindingObserver, StateMixin {
  String? status = LocaleKeys.status_online.tr();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      return ChatCubit(
        FireStoreService(FirebaseFirestore.instance),
      )..init(LocaleKeys.status_online.tr());
    }, child: BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: context.colorScheme.background,
        appBar: _appbar(state),
        body: _body(context, state),
      );
    }));
  }
}

AppBarWidget _appbar(state) => AppBarWidget(
      state: state,
    );

Widget _body(BuildContext context, ChatState state) => Column(
      children: [
        _Tabbar(state: state),
        context.emptySizedHeightBoxLow,
        state.isLoading == true
            ? Center(
                child: CircularProgressIndicator(
                  color: context.colorScheme.primary,
                ),
              )
            : MyUserList(state: state),
      ],
    );
