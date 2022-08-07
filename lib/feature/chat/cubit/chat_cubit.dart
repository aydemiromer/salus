import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:salus/feature/chat/model/chat_model.dart';
import 'package:salus/product/enums/firebase_enums.dart';
import 'package:salus/product/model/user/user_model.dart';
import 'package:salus/feature/chat/service/Ifirebase_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../product/init/language/locale_keys.g.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.firebaseService) : super(ChatState());
  final IFirebaseService firebaseService;

  Future<void> init(String status) async {
    emit(state.copyWith(isLoading: true));
    getUsersFromFirebase();
    final prefs = await SharedPreferences.getInstance();

    final String? userID = prefs.getString(FirebaseEnums.userUID.name);
    final String? userRole = prefs.getString(FirebaseEnums.userRole.name);
    final String? userCorp = prefs.getString(FirebaseEnums.whoCorp.name);

    emit(state.copyWith(userUID: userID, userRole: userRole, userCorpAssign: userCorp, isLoading: false));

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
    await firebaseService.setAssign(userID, LocaleKeys.assignment_therapist.tr());
  }

  void userUid() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userID = prefs.getString(FirebaseEnums.userUID.name);
    final String? userRole = prefs.getString(FirebaseEnums.userRole.name);

    emit(state.copyWith(userUID: userID, userRole: userRole));
  }

  Future<List<UserModel>> getUsersFromFirebase() async {
    emit(state.copyWith(isLoading: true));
    var response = await firebaseService.userList();

    emit(state.copyWith(userList: response, isLoading: false));

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
