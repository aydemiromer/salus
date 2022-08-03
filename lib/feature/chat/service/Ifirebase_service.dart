import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/chat_model.dart';
import '../../../product/model/user/user_model.dart';

abstract class IFirebaseService {
  final FirebaseFirestore fireStore;

  IFirebaseService(this.fireStore);

  Future<List<UserModel>> userList();

  Future setStatus(String userID, String status);

  Stream<List<ChatModel>> getChatMessages(String userID, String otherUserID);

  Future<bool> saveMessage(ChatModel message, String userID);
}
