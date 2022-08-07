import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/utility/padding/page_padding.dart';
import '../../../feature/chat/model/chat_model.dart';
import '../../utils/text/product_text.dart';

// ignore: must_be_immutable
class ChatBox extends StatelessWidget {
  ChatBox({Key? key, required this.model, required this.axisType, required this.date}) : super(key: key);
  final ChatModel? model;
  String date;
  CrossAxisAlignment axisType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.allLow(),
      child: Column(
        crossAxisAlignment: axisType,
        children: [_messagesContainer(context)],
      ),
    );
  }

  Column _messagesContainer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: context.dynamicWidth(.6),
          padding: const PagePadding.allLow(),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: context.colorScheme.onTertiary),
          child: Column(
            children: [
              ProductText.normalGreyWithBoldOption(
                model?.message.toString() ?? '',
                context: context,
                fontWeight: FontWeight.w300,
              ),
            ],
          ),
        ),
        ProductText.normalGreyWithBoldOption(
          date.toString(),
          context: context,
          fontWeight: FontWeight.w300,
        ),
      ],
    );
  }
}
