import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/init/socials/provider/login/services/apple_social_login.dart';
import '../../../../core/init/socials/provider/login/services/google_social_login.dart';
import '../../../../product/mixin/error_mixin.dart';
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

  Future<UserCredential?> signinWithCustom(LoginModel model);
  Future<UserCredential?> registerCustom(RegisterModel model);
  Future<UserCredential?> signinGoogleCustom();
  Future<UserCredential?> signinAppleCustom();
}

class AuthenticationService extends IAuthenticationService with ErrorMixin {
  AuthenticationService(FirebaseAuth firebaseAuth, GoogleLogin googleLogin, AppleSocialLogin appleSocialLogin)
      : super(firebaseAuth, appleSocialLogin, googleLogin);

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
  Future<UserCredential?> registerCustom(RegisterModel model) async {
    try {
      final response = await firebaseAuth.createUserWithEmailAndPassword(email: model.email, password: model.password);
      await firebaseAuth.currentUser?.updateDisplayName(model.name);
      return response;
    } catch (error) {
      showError(error);
      return null;
    }
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
}
