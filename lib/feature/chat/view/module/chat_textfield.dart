part of '../chat_detail_view.dart';

class ChatTextField extends StatelessWidget {
  ChatTextField({Key? key, this.textController, required this.user}) : super(key: key);
  TextEditingController? textController;
  final user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.allLow2x() / 2,
      child: Container(
        color: context.colorScheme.background,
        child: Row(
          children: [
            Expanded(
                child: TextField(
              controller: textController,
            )),
            IconButton(
                color: context.colorScheme.surface,
                onPressed: () async {
                  if (textController!.text.trim().isNotEmpty) {
                    ChatModel currentMessage = ChatModel(
                        getter: user.userID,
                        sender: "NBfK00HIJdQJkswnarTm5OIZwpr2",
                        whoIsThis: true,
                        message: textController!.text);
                    var result =
                        await context.read<ChatCubit>().saveMessages(currentMessage, "NBfK00HIJdQJkswnarTm5OIZwpr2");

                    if (result) {
                      textController!.clear();
                    }
                  }
                },
                icon: const Icon(Icons.send))
          ],
        ),
      ),
    );
  }
}
