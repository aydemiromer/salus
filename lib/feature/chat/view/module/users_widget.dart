part of '../chat_view.dart';

class MyUserList extends StatelessWidget {
  const MyUserList({Key? key, required this.state}) : super(key: key);
  final ChatState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.background,
      height: context.dynamicHeight(.715),
      child: ListView.builder(
          itemCount: state.userList!.length - 1,
          itemBuilder: ((context, index) {
            UserModel user = state.userList?[index];
            return ColumnWithSpacing(space: 10, children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatDetailView(
                                model: user,
                              )),
                    );
                  },
                  child: state.userUID == state.userList?[index].userID ? null : _userListTile(context, user)),
              const GrayDivider(),
            ]);
          })),
    );
  }

  ListTile _userListTile(BuildContext context, UserModel user) {
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
                    backgroundColor: user.status.toString() == LocaleKeys.status_online.tr()
                        ? context.colorScheme.surface
                        : Colors.transparent,
                  ))
            ],
          )),
      title: Row(
        children: [
          ProductText.semiBoldNormal(
            user.name.toString(),
            context: context,
          ),
          _assignmentStatusCard(context, user)
        ],
      ),
      subtitle: const Text(
        "Lorem İpsum Lorem İpsum Lorem İpsummm Lorem İpsum  Lorem İpsum  Lorem İpsum",
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  SizedBox _assignmentStatusCard(BuildContext context, UserModel user) {
    return SizedBox(
      child: Card(
        color: state.colorCondition(context, user.assignment.toString()),
        child: Padding(
          padding: const PagePadding.allLow(),
          child: Text(
            user.assignment.toString(),
          ),
        ),
      ),
    );
  }
}
