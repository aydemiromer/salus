part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final List? userList;
  final Stream<List<ChatModel>>? messageList;
  final String? userUID;
  final String? userRole;
  final String? userCorpAssign;
  String? category = "user";
  final bool isLoading;

  ChatState(
      {this.isLoading = false,
      this.userList,
      this.messageList,
      this.userUID,
      this.category,
      this.userRole,
      this.userCorpAssign});

  Color colorCondition(BuildContext context, String status) => status == LocaleKeys.assignment_appoinment.tr()
      ? context.colorScheme.outline
      : status == LocaleKeys.assignment_new.tr()
          ? context.colorScheme.onInverseSurface
          : context.colorScheme.onSurface;

  @override
  List<dynamic> get props => [userList, messageList, userUID, category, userRole];

  ChatState copyWith(
      {List? userList,
      Stream<List<ChatModel>>? messageList,
      String? userUID,
      String? category = "user",
      String? userRole,
      String? userCorpAssign,
      bool? isLoading}) {
    return ChatState(
        userList: userList ?? this.userList,
        messageList: messageList ?? this.messageList,
        userUID: userUID ?? this.userUID,
        category: category ?? this.category,
        userRole: userRole ?? this.userRole,
        userCorpAssign: userCorpAssign ?? this.userCorpAssign,
        isLoading: isLoading ?? this.isLoading);
  }
}
