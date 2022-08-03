part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final List? userList;
  final Stream<List<ChatModel>>? messageList;
  final String? userUID;

  const ChatState({this.userList, this.messageList,this.userUID});

  Color colorCondition(BuildContext context, String status) => status == LocaleKeys.assignment_appoinment.tr()
      ? context.colorScheme.outline
      : status == LocaleKeys.assignment_new.tr()
          ? context.colorScheme.onInverseSurface
          : context.colorScheme.onSurface;

  @override
  List<dynamic> get props => [userList, messageList,userUID];

  ChatState copyWith({List? userList, Stream<List<ChatModel>>? messageList, String? userUID}) {
    return ChatState(
      userList: userList ?? this.userList,
      messageList: messageList ?? this.messageList,
      userUID: userUID ?? this.userUID
    );
  }
}
