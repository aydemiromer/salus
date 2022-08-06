import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:salus/feature/chat/model/chat_model.dart';
import 'package:salus/product/model/user/user_model.dart';
import 'package:salus/feature/chat/service/Ifirebase_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../product/init/language/locale_keys.g.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.firebaseService) : super(ChatState());
  final IFirebaseService firebaseService;

  Future<void> init(String status) async {
    getUsersFromFirebase();
    final prefs = await SharedPreferences.getInstance();

    final String? userID = prefs.getString('userUID');
    final String? userRole = prefs.getString('userRole');
    final String? userCorp = prefs.getString('WhoCorp');

    emit(state.copyWith(userUID: userID, userRole: userRole, userCorpAssign: userCorp));

    changeStatusPerson(userID ?? '', status);
    tokenForNotification(userID.toString());
  }

  Future tokenForNotification(String userID) async {
    await firebaseService.getAndPushToken(userID);
  }

  void changeCategory() {
    if (state.category == "user") {
      emit(state.copyWith(category: "corp"));
    } else {
      emit(state.copyWith(category: "user"));
    }
  }

  Future assignCorp(String userID, String corpID) async {
    await firebaseService.corpAssign(userID, corpID);
    await firebaseService.setAssign(userID, "Terapist Atandı");
  }

  void userUid() async {
    final prefs = await SharedPreferences.getInstance();

    final String? userID = prefs.getString('userUID');
    final String? userRole = prefs.getString('userRole');

    emit(state.copyWith(userUID: userID, userRole: userRole));
  }

  Future<List<UserModel>> getUsersFromFirebase() async {
    var response = await firebaseService.userList();

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
