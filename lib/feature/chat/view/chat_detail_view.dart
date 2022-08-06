import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:salus/product/service/notification.dart';
import 'package:salus/product/widget/chat/chat_box.dart';
import 'package:salus/product/widget/divider/gray_divider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utility/padding/page_padding.dart';
import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/service/Inotification.dart';
import '../../../product/utils/text/product_text.dart';
import '../../../product/widget/appBar/app_bar_widget.dart';
import '../cubit/chat_cubit.dart';
import '../model/chat_model.dart';
import '../../../product/model/user/user_model.dart';
import '../service/firebase_service.dart';
part 'module/chat_detail_user_listtile.dart';
part 'module/chat_messages.dart';
part 'module/chat_textfield.dart';

class ChatDetailView extends StatefulWidget {
  const ChatDetailView({Key? key, required this.model, this.chatUser, this.currentUser}) : super(key: key);
  final UserModel model;
  final UserModel? currentUser;
  final UserModel? chatUser;
  @override
  State<ChatDetailView> createState() => _ChatDetailViewState();
}

class _ChatDetailViewState extends State<ChatDetailView> {
  @override
  TextEditingController? _textController;
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return ChatCubit(
            FireStoreService(FirebaseFirestore.instance),
          )..init(LocaleKeys.status_online.tr());
        },
        child: BlocBuilder<ChatCubit, ChatState>(
            builder: ((context, state) => Scaffold(
                  backgroundColor: context.colorScheme.onBackground,
                  appBar: _appbar(state),
                  body: _body(context, widget.model, _textController, state),
                ))));
  }
}

AppBarWidget _appbar(state) => AppBarWidget(
      state: state,
    );

Widget _body(BuildContext context, UserModel user, textController, ChatState state) => Column(
      children: [
        _DetailListTile(user: user, state: state),
        const GrayDivider(),
        _streamMessages(context, user, state),
        ChatTextField(
          user: user,
          textController: textController,
          state: state,
        )
      ],
    );

Expanded _streamMessages(BuildContext context, UserModel user, ChatState state) {
  return Expanded(
      child: Container(
    color: context.colorScheme.background,
    child: StreamBuilder<List<ChatModel>>(
      stream: context.read<ChatCubit>().getMessages(state.userUID.toString(), user.userID.toString()),
      builder: (context, streamMessages) {
        var allMessages = streamMessages.data;
        return ListView.builder(
            itemBuilder: ((context, index) {
              return _ChatMessagesState(model: allMessages?[index] ?? ChatModel());
            }),
            itemCount: allMessages?.length ?? 0);
      },
    ),
  ));
}
