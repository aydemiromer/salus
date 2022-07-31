import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salus/feature/chat/model/user_model.dart';
import 'package:salus/feature/chat/service/Ifirebase_service.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.firebaseService) : super(const ChatState());
  final IFirebaseService firebaseService;

  Future<void> init() async {
    getUsersFromFirebase();
  }

  Future<List<User>> getUsersFromFirebase() async {
    final response = await firebaseService.userList();
    print("Chat Cubit Response");
    print(response);
    emit(state.copyWith(userList: response));
    return response;
  }
}
