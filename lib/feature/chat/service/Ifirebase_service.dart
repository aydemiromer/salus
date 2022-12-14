import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/chat_model.dart';
import '../../../product/model/user/user_model.dart';

abstract class IFirebaseService {
  final FirebaseFirestore fireStore;

  IFirebaseService(this.fireStore);

  Future<List<UserModel>> userList();

  Future setStatus(String userID, String status);

  Future<bool> setAssign(String userID, String assingnText);

  Stream<List<ChatModel>> getChatMessages(String userID, String otherUserID);

  Future<bool> saveMessage(ChatModel message, String userID);

  Future corpAssign(String userID, String corpID);

  Future getAndPushToken(String userID);

  Future registerUser(String userID, String name, String email, String surname);

  Future updateProfile(String name, String surname);

  Future getLastMessages(String userID, List usersID);
}
