import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../crypto/string_crypto.dart';
import '../social_login.dart';

class AppleSocialLogin extends ISocialLogin with StringCrypto {
  final _appleOuthKey = "apple.com";

  @override
  Future<UserCredential?> login<T>() async {
    final credantial = await _signInWithApple();
    final response = await FirebaseAuth.instance.signInWithCredential(credantial);
    return response;
  }

  Future<OAuthCredential> _signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ], nonce: nonce);

    return OAuthProvider(_appleOuthKey).credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );
  }
}
