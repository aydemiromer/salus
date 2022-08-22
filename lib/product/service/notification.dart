import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';

import 'Inotification.dart';

class NotificationService extends IFirebaseNotificationService {
  @override
  Future sendNotification(String? token, String? message, String? name) async {
    
    String endURL = "https://fcm.googleapis.com/fcm/send";
    String firebaseKey = "key";
        
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
