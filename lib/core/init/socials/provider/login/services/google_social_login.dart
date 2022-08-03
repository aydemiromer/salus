import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../social_login.dart';

class GoogleLogin extends ISocialLogin {
  @override
  Future<UserCredential?> login<T>() async {
    final credantial = await _signInWithGoogle();
    final response = await FirebaseAuth.instance.signInWithCredential(credantial);
    return response;
  }

  Future<OAuthCredential> _signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    return GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
  }
}
