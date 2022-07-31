import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salus/core/widget/button/custom_elevated_button.dart';
import 'package:salus/product/init/language/locale_keys.g.dart';
import 'package:salus/product/utils/text/product_text.dart';
import 'package:salus/product/widget/appBar/app_bar_widget.dart';
import 'package:kartal/kartal.dart';
part 'module/tabbar_widget.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.onBackground,
      appBar: _appbar,
      body: _body(context),
    );
  }
}

AppBarWidget get _appbar => AppBarWidget();

Widget _body(BuildContext context) => Column(
      children: [
        context.emptySizedHeightBoxLow,
        const _Tabbar(),
      ],
    );
