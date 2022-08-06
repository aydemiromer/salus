abstract class IFirebaseNotificationService {
  IFirebaseNotificationService();

  Future sendNotification(String? token, String? message, String? name);
}
