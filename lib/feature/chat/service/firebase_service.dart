import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salus/feature/chat/model/chat_model.dart';
import 'package:salus/feature/chat/service/Ifirebase_service.dart';
import 'package:salus/product/enums/firebase_enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:core';
import '../../../product/model/user/user_model.dart';

class FireStoreService extends IFirebaseService {
  FireStoreService(FirebaseFirestore firestore) : super(firestore);

  @override
  Future<List<UserModel>> userList() async {
    List<UserModel> myUsers = [];

    try {
      QuerySnapshot querySnapshot = await fireStore.collection(FirebaseEnums.users.name).get();
      for (DocumentSnapshot snap in querySnapshot.docs) {
        Map<String, dynamic> map = snap.data() as Map<String, dynamic>;
        UserModel tekUser = UserModel.fromMap(map);
        final prefs = await SharedPreferences.getInstance();

        final String? userID = prefs.getString('userUID');
        tekUser.userID == userID ? prefs.setString('userRole', tekUser.role.toString()) : null;
        tekUser.userID == userID ? prefs.setString('WhoCorp', tekUser.corp.toString()) : null;
        myUsers.add(tekUser);
      }
    } catch (error) {
      return [];
    }

    return myUsers;
  }

  Future getUserInformations(String userID) async {
    try {
      await fireStore.collection(FirebaseEnums.users.name).doc(userID).get();
    } catch (e) {
      return null;
    }
  }

  @override
  Future setStatus(String userID, String status) async {
    try {
      await fireStore.collection(FirebaseEnums.users.name).doc(userID).update({FirebaseEnums.status.name: status});
    } catch (error) {
      return null;
    }
    return null;
  }

  @override
  Future corpAssign(String userID, String corpID) async {
    try {
      await fireStore.collection(FirebaseEnums.users.name).doc(userID).update({"corp": corpID});
    } catch (error) {
      return null;
    }
    return null;
  }

  @override
  Stream<List<ChatModel>> getChatMessages(String userID, String otherUserID) {
    var snapShot = fireStore
        .collection(FirebaseEnums.chat.name)
        .doc("${userID}1to1$otherUserID")
        .collection(FirebaseEnums.message.name)
        .orderBy(FirebaseEnums.date.name)
        .limit(1)
        .snapshots();
    return snapShot.map((mesajListesi) => mesajListesi.docs.map((mesaj) => ChatModel.fromMap(mesaj.data())).toList());
  }

  @override
  Future<bool> saveMessage(ChatModel message, String userID) async {
    var messageId =
        fireStore.collection(FirebaseEnums.users.name).doc(userID).collection(FirebaseEnums.chat.name).doc().id;
    var myDocumentID = "${message.sender}1to1${message.getter}";
    var receiverDocumentID = "${message.getter}1to1${message.sender}";

    var savedMessage = message.toMap();

    await fireStore
        .collection(FirebaseEnums.chat.name)
        .doc(myDocumentID)
        .collection(FirebaseEnums.message.name)
        .doc(messageId)
        .set(savedMessage);

    savedMessage.update('whoIsThis', (value) => false);

    await fireStore
        .collection(FirebaseEnums.chat.name)
        .doc(receiverDocumentID)
        .collection(FirebaseEnums.message.name)
        .doc(messageId)
        .set(savedMessage);

    await fireStore.collection(FirebaseEnums.users.name).doc(message.sender).update({
      "message": message.message,
    });
    return true;
  }

  @override
  Future<bool> setAssign(String userID, String assingnText) async {
    try {
      await fireStore.collection(FirebaseEnums.users.name).doc(userID).update({'assignment': assingnText});
      return true;
    } catch (e) {
      return false;
    }
  }
}
