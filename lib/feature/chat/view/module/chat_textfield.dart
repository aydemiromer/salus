part of '../chat_detail_view.dart';

class ChatTextField extends StatelessWidget {
  ChatTextField({Key? key, this.textController, required this.user, required this.state}) : super(key: key);
  TextEditingController? textController;
  UserModel user;
  ChatState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.allLow2x() / 2,
      child: Container(
        color: context.colorScheme.background,
        child: _messageTextFieldAndButton(context),
      ),
    );
  }

  Row _messageTextFieldAndButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: textController,
        )),
        IconButton(
            color: context.colorScheme.surface,
            onPressed: () async {
              if (textController!.text.trim().isNotEmpty) {
                final prefs = await SharedPreferences.getInstance();

                final String? userID = prefs.getString(FirebaseEnums.userUID.name);
                ChatModel currentMessage =
                    ChatModel(getter: user.userID, sender: userID, whoIsThis: true, message: textController!.text);
                // ignore: use_build_context_synchronously
                var result = await context.read<ChatCubit>().saveMessages(currentMessage, userID.toString());
                // ignore: unused_local_variable
                IFirebaseNotificationService? firebaseService;

                await NotificationService()
                    .sendNotification(user.deviceToken, textController!.text.toString(), userID.toString());

                if (result) {
                  textController!.clear();
                }
              }
            },
            icon: const Icon(Icons.send))
      ],
    );
  }
}
