import 'package:dio/dio.dart';
import 'package:salus/feature/chat/model/chat_model.dart';
import 'package:salus/product/model/user/user_model.dart';

import 'Inotification.dart';

class NotificationService extends IFirebaseNotificationService {
  @override
  Future sendNotification(String? token, ChatModel message, UserModel userModel) async {
    String endURL = "https://fcm.googleapis.com/fcm/send";
    String firebaseKey = "BURAYA KENDI FIREBASE SUNUCU ANAHTARINIZI YAZINIZ";
    Map<String, String> headers = {"Content-type": "application/json", "Authorization": "key=$firebaseKey"};

    String json =
        '{ "to" : "$token", "data" : { "message" : "${message.message}", "title": "${userModel.name} yeni mesaj",  "gonderenUserID" : "${userModel.userID}" } }';

    final response = await Dio().post(endURL,
        options: Options(
          headers: headers,
        ),
        data: json);
  }
}
