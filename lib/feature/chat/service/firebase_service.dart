import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salus/feature/chat/service/Ifirebase_service.dart';
import 'dart:core';
import '../model/user_model.dart';

class FireStoreService extends IFirebaseService {
  FireStoreService(FirebaseFirestore firestore) : super(firestore);

  @override
  Future<List<User>> userList() async {
    List<User> myUsers = [];

    try {
      QuerySnapshot querySnapshot = await fireStore.collection('users').get();
      for (DocumentSnapshot snap in querySnapshot.docs) {
        Map<String, dynamic> map = snap.data() as Map<String, dynamic>;
        User tekUser = User.fromMap(map);

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
}
