part of '../chat_detail_view.dart';

class _ChatMessagesState extends StatelessWidget {
  const _ChatMessagesState({required this.model});
  final ChatModel model;
  @override
  Widget build(BuildContext context) {
    var benimMesajimMi = model.whoIsThis;

    var timeValues = _timeShowing(model.date ?? Timestamp(1,1));

    if (benimMesajimMi!) {
      return ChatBox(model: model, axisType: CrossAxisAlignment.end,date: timeValues);
    } else {
      return ChatBox(model: model, axisType: CrossAxisAlignment.start,date: timeValues);
    }
  }

  String _timeShowing(Timestamp date) {
    var format = DateFormat.Hm();
    var formatedDate = format.format(date.toDate());
    return formatedDate;
  }
}
