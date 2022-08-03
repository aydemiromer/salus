import 'package:encrypt/encrypt.dart';

mixin StringEncryption {
  static String encryptString({required String text, required String key1}) {
    final key = Key.fromUtf8(key1);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    return encrypter.encrypt(text, iv: iv).base64;
  }

  static String decryptString({required String text, required String key1}) {
    final key = Key.fromUtf8(key1);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    return encrypter.decrypt(Encrypted.from64(text), iv: iv);
  }
}
