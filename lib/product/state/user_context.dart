import 'package:firebase_auth/firebase_auth.dart';

import '../model/user/user_model.dart';


class UserContext {
  late FirebaseAuth _firebaseAuth;
  User? user;
  String get firebaseUid => _firebaseAuth.currentUser?.uid ?? '';
  UserModel? userModel;

  void saveAuth(FirebaseAuth auth) {
    _firebaseAuth = auth;
  }

  void saveUserModel(UserModel? model) {
    userModel = model;
  }

  Future<void> signoutUser() async {
    await _firebaseAuth.signOut();
  }

  void listenAuth() {
    _firebaseAuth.authStateChanges().listen((event) {
      user = event;
    });
  }
}
