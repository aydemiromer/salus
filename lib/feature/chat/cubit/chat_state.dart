part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final List? userList;
  final Stream<List<ChatModel>>? messageList;

  const ChatState({this.userList, this.messageList});

  Color colorCondition(BuildContext context, String status) => status == LocaleKeys.assignment_appoinment.tr()
      ? context.colorScheme.outline
      : status == LocaleKeys.assignment_new.tr()
          ? context.colorScheme.onInverseSurface
          : context.colorScheme.onSurface;

  @override
  List<dynamic> get props => [userList, messageList];

  ChatState copyWith({List? userList, Stream<List<ChatModel>>? messageList}) {
    return ChatState(
      userList: userList ?? this.userList,
      messageList: messageList ?? this.messageList,
    );
  }
}
