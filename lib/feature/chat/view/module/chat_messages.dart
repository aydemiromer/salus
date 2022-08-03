part of '../chat_detail_view.dart';

class _ChatMessagesState extends StatelessWidget {
  const _ChatMessagesState({required this.model});
  final ChatModel? model;
  @override
  Widget build(BuildContext context) {
    var benimMesajimMi = model?.whoIsThis;
    if (benimMesajimMi!) {
      return ChatBox(model: model, axisType: CrossAxisAlignment.end);
    } else {
      return ChatBox(model: model, axisType: CrossAxisAlignment.start);
    }
  }
}
