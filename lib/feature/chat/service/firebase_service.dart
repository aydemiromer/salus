import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salus/feature/chat/model/chat_model.dart';
import 'package:salus/feature/chat/service/Ifirebase_service.dart';
import 'dart:core';
import '../../../product/model/user/user_model.dart';

class FireStoreService extends IFirebaseService {
  FireStoreService(FirebaseFirestore firestore) : super(firestore);

  @override
  Future<List<UserModel>> userList() async {
    List<UserModel> myUsers = [];

    try {
      QuerySnapshot querySnapshot = await fireStore.collection('users').get();
      for (DocumentSnapshot snap in querySnapshot.docs) {
        Map<String, dynamic> map = snap.data() as Map<String, dynamic>;
        UserModel tekUser = UserModel.fromMap(map);

        myUsers.add(tekUser);
      }
    } catch (error) {}

    return myUsers;
  }

  @override
  Future setStatus(String userID, String status) async {
    try {
      await fireStore.collection('users').doc(userID).update({"status": status});
    } catch (error) {}
    return null;
  }

  @override
  Stream<List<ChatModel>> getChatMessages(String userID, String otherUserID) {
    var snapShot = fireStore
        .collection('chat')
        .doc("${userID}1to1$otherUserID")
        .collection('messages')
        .orderBy('date')
        .snapshots();
    return snapShot.map((mesajListesi) => mesajListesi.docs.map((mesaj) => ChatModel.fromMap(mesaj.data())).toList());
  }

  @override
  Future<bool> saveMessage(ChatModel message, String userID) async {
    var messageId = fireStore.collection('users').doc(userID).collection('chat').doc().id;
    var myDocumentID = "${message.sender}1to1${message.getter}";
    var receiverDocumentID = "${message.getter}1to1${message.sender}";

    var savedMessage = message.toMap();

    await fireStore.collection('chat').doc(myDocumentID).collection('messages').doc(messageId).set(savedMessage);

    savedMessage.update('whoIsThis', (value) => false);

    await fireStore.collection('chat').doc(receiverDocumentID).collection('messages').doc(messageId).set(savedMessage);

    await fireStore.collection('chat').doc(receiverDocumentID).set({
      "sender": message.sender,
      "getter": message.getter,
      "message": message.message,
      "date": FieldValue.serverTimestamp(),
    });
    return true;
  }
}
