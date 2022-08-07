part of '../chat_detail_view.dart';

class _ChatMessagesState extends StatelessWidget {
  const _ChatMessagesState({required this.model});
  final ChatModel model;
  @override
  Widget build(BuildContext context) {
    var benimMesajimMi = model.whoIsThis;

    var _timeValues = _timeShowing(model.date ?? Timestamp(1,1));

    if (benimMesajimMi!) {
      return ChatBox(model: model, axisType: CrossAxisAlignment.end,date: _timeValues);
    } else {
      return ChatBox(model: model, axisType: CrossAxisAlignment.start,date: _timeValues);
    }
  }

  String _timeShowing(Timestamp date) {
    var _format = DateFormat.Hm();
    var _formatedDate = _format.format(date.toDate());
    return _formatedDate;
  }
}
