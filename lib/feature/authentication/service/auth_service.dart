import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/init/socials/provider/login/services/apple_social_login.dart';
import '../../../../core/init/socials/provider/login/services/google_social_login.dart';
import '../../../../product/mixin/error_mixin.dart';
import '../../chat/service/Ifirebase_service.dart';
import '../../chat/service/firebase_service.dart';
import '../model/login_model.dart';
import '../model/register_model.dart';

abstract class IAuthenticationService {
  final FirebaseAuth firebaseAuth;
  final AppleSocialLogin appleSocialLogin;
  final GoogleLogin googleLogin;

  IAuthenticationService(
    this.firebaseAuth,
    this.appleSocialLogin,
    this.googleLogin,
  );

  User? currentUser;
  Stream<User?>? authStateChanges();
  Future<UserCredential?> signinWithCustom(LoginModel model);
  Future<UserCredential?> registerCustom(RegisterModel model, String name, String surname);
  Future<UserCredential?> signinGoogleCustom();
  Future<UserCredential?> signinAppleCustom();
  Future<void> signOut();
}

class AuthenticationService extends IAuthenticationService with ErrorMixin {
  AuthenticationService(FirebaseAuth firebaseAuth, GoogleLogin googleLogin, AppleSocialLogin appleSocialLogin)
      : super(firebaseAuth, appleSocialLogin, googleLogin);

  @override
  Stream<User?>? authStateChanges() => firebaseAuth.authStateChanges();

  @override
  Future<UserCredential?> signinWithCustom(LoginModel model) async {
    try {
      final response = await firebaseAuth.signInWithEmailAndPassword(email: model.email, password: model.password);

      return response;
    } catch (error) {
      showError(error);
      return null;
    }
  }

  @override
  Future<UserCredential?> registerCustom(RegisterModel model, String name, String surname) async {
    try {
      IFirebaseService? firebaseService = FireStoreService(FirebaseFirestore.instance);
      final response = await firebaseAuth.createUserWithEmailAndPassword(email: model.email, password: model.password);
      String? Uid = firebaseAuth.currentUser?.uid;
      await firebaseService.registerUser(Uid.toString(), name, model.email, surname);

      await firebaseAuth.currentUser?.updateDisplayName(model.name);
      //return response;
    } catch (error) {
      showError(error);
      return null;
    }
    return null;
  }

  @override
  Future<UserCredential?> signinGoogleCustom() async {
    try {
      final response = await googleLogin.login();
      return response;
    } catch (error) {
      showError(error);
      return null;
    }
  }

  Future resetPassword() async {
    await firebaseAuth.sendPasswordResetEmail(email: firebaseAuth.currentUser?.email ?? "");
  }

  @override
  Future<UserCredential?> signinAppleCustom() async {
    try {
      final response = await appleSocialLogin.login();
      return response;
    } catch (error) {
      showError(error);
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  User? get currentUser => firebaseAuth.currentUser;
}
