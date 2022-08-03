import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/utility/padding/page_padding.dart';
import '../../../feature/chat/model/chat_model.dart';
import '../../utils/text/product_text.dart';

class ChatBox extends StatelessWidget {
  ChatBox({Key? key, required this.model, required this.axisType}) : super(key: key);
  final ChatModel? model;
  CrossAxisAlignment axisType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.allLow(),
      child: Column(
        crossAxisAlignment: axisType,
        children: [
          Container(
            width: context.dynamicWidth(.6),
            padding: const PagePadding.allLow(),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: context.colorScheme.onTertiary),
            child: ProductText.normalGreyWithBoldOption(
              model?.message.toString() ?? '',
              context: context,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}
