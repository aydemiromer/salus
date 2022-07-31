part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final List? userList;
  

  const ChatState({this.userList});

  @override
  List<dynamic> get props => [userList];

  ChatState copyWith({List? userList}) {
    return ChatState(userList: userList ?? this.userList);
  }
}
