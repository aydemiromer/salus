import 'package:firebase_auth/firebase_auth.dart';

typedef SocialLoginCallBack = void Function(UserCredential? credential);

abstract class ISocialLogin {
  Future<UserCredential?> login<T>();
}
