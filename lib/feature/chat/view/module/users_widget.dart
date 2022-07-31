part of '../chat_view.dart';

class MyUserList extends StatelessWidget {
  const MyUserList({Key? key, required this.state}) : super(key: key);
  final ChatState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.background,
      height: context.dynamicHeight(.7),
      child: ListView.builder(
          itemCount: state.userList?.length ?? 0,
          itemBuilder: ((context, index) {
            User user = state.userList?[index];
            return ColumnWithSpacing(space: 10, children: [_userListTile(context, user), const GrayDivider()]);
          })),
    );
  }

  ListTile _userListTile(BuildContext context, User user) {
    return ListTile(
      leading: CircleAvatar(
          radius: 30,
          backgroundColor: context.colorScheme.onTertiary,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: ProductText.semiBoldNormal(
                  '${user.name?[0]} ${user.surname?[0]} ',
                  context: context,
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor:
                        user.status.toString() == "Çevrimiçi" ? context.colorScheme.surface : Colors.transparent,
                  ))
            ],
          )),
      title: ProductText.semiBoldNormal(
        user.name.toString(),
        context: context,
      ),
      subtitle: const Text(""),
    );
  }
}
