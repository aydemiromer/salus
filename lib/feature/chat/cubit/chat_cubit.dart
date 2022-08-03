import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:salus/feature/chat/model/chat_model.dart';
import 'package:salus/product/model/user/user_model.dart';
import 'package:salus/feature/chat/service/Ifirebase_service.dart';

import '../../../product/init/language/locale_keys.g.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.firebaseService) : super(const ChatState());
  final IFirebaseService firebaseService;

  Future<void> init(String userID, String status) async {
    getUsersFromFirebase();

    changeStatusPerson(userID, status);
  }

  Future<List<User>> getUsersFromFirebase() async {
    final response = await firebaseService.userList();
    emit(state.copyWith(userList: response));
    return response;
  }

  Stream<List<ChatModel>> getMessages(String userID, String otherUserID) {
    final response = firebaseService.getChatMessages(userID, otherUserID);
    emit(state.copyWith(messageList: response));
    return response;
  }

  Future<bool> saveMessages(ChatModel message, String userID) {
    final response = firebaseService.saveMessage(message, userID);
    //emit(state.copyWith(messageList: response));
    return response;
  }

  Future<bool?> changeStatusPerson(String userID, String status) async {
    await firebaseService.setStatus(userID, status);
    return null;
  }
}
