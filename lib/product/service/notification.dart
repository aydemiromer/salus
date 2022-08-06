import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';

import 'Inotification.dart';

class NotificationService extends IFirebaseNotificationService {
  @override
  Future sendNotification(String? token, String? message, String? name) async {
    print("girdi");
    String endURL = "https://fcm.googleapis.com/fcm/send";
    String firebaseKey =
        "AAAA5VeSzzI:APA91bFvk-Sdyij_QYYayxrGt7tNAI0dWFzWJYqL1hFrH8w8J4uJsgzrNdD24dTg_d6TGIPaxwL7ItdcskxrLTzeXoHt-_oIECfO4aC9eyPtMPXL6B7kxvXtrZ7d4ERqAiaVbWLABYNY";
    Map<String, String> headers = {"Content-type": "application/json", "Authorization": "key=$firebaseKey"};

    String json =
        '{  "to": "$token", "data": {}, "notification": {"body": "$message", "title": "$name yeni mesaj"}, "android": {"priority": "high"},}';

    final response = await Dio().post(endURL,
        options: Options(
          headers: headers,
        ),
        data: json);

    debugPrint(response.statusCode.toString());
  }
}
