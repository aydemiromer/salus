import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

abstract class IFirebaseService {
  final FirebaseFirestore fireStore;

  IFirebaseService(this.fireStore);

  Future<List<User>> userList();
}
