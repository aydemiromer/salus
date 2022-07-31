part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final List? userList;

  const ChatState({this.userList});

  Color colorCondition(BuildContext context, String status) => status == LocaleKeys.assignment_appoinment.tr()
      ? context.colorScheme.outline
      : status == LocaleKeys.assignment_new.tr()
          ? context.colorScheme.surface
          : context.colorScheme.onSurface;

  @override
  List<dynamic> get props => [userList];

  ChatState copyWith({List? userList}) {
    return ChatState(userList: userList ?? this.userList);
  }
}
