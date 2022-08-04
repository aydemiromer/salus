
import '../../feature/chat/model/chat_model.dart';
import '../model/user/user_model.dart';

abstract class IFirebaseNotificationService {
  

  IFirebaseNotificationService();

  Future sendNotification(String? token, ChatModel message, UserModel userModel);

}
