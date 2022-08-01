import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:salus/product/widget/divider/gray_divider.dart';

import '../../../core/utility/padding/page_padding.dart';
import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/utils/text/product_text.dart';
import '../../../product/widget/appBar/app_bar_widget.dart';
import '../cubit/chat_cubit.dart';
import '../model/user_model.dart';
import '../service/firebase_service.dart';
part 'module/chat_detail_user_listtile.dart';

class ChatDetailView extends StatefulWidget {
  const ChatDetailView({Key? key, required this.model}) : super(key: key);
  final User model;
  @override
  State<ChatDetailView> createState() => _ChatDetailViewState();
}

class _ChatDetailViewState extends State<ChatDetailView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return ChatCubit(FireStoreService(FirebaseFirestore.instance))
            ..init("oAm1kmK128Wr4iY0gJzXHWDUDlq1", LocaleKeys.status_online.tr());
        },
        child: Scaffold(
          backgroundColor: context.colorScheme.onBackground,
          appBar: _appbar,
          body: _body(context, widget.model),
        ));
  }
}

AppBarWidget get _appbar => AppBarWidget();

Widget _body(BuildContext context, user) => BlocBuilder<ChatCubit, ChatState>(
    builder: ((context, state) => Column(
          children: [
            _DetailListTile(user: user, state: state),
            const GrayDivider(),
          ],
        )));
