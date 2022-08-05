part of '../chat_view.dart';

class MyUserList extends StatelessWidget {
  MyUserList({Key? key, required this.state}) : super(key: key);
  final ChatState state;
  List<UserModel> corp = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.background,
      height: context.dynamicHeight(.615),
      child: ListView.builder(
          itemCount: state.userList!.length - 1,
          itemBuilder: ((context, index) {
            UserModel user = state.userList?[index];

            state.userList?[index].role.toString() == "corp" ? corp.add(state.userList?[index]) : null;
            debugPrint(corp.toString());
            debugPrint(corp.length.toString());
            return ColumnWithSpacing(space: 5, children: [
              InkWell(
                  onLongPress: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            color: context.colorScheme.background,
                            height: context.dynamicHeight(.5),
                            child: ListView.builder(
                              itemCount: corp.length,
                              itemBuilder: ((context, index) {
                                return CustomElevatedButton(
                                  color: context.colorScheme.primary,
                                  height: context.dynamicHeight(.08),
                                  onPressed: () {
                                    context
                                        .read<ChatCubit>()
                                        .assignCorp(state.userList?[index].userID, corp[index].userID.toString());

                                    
                                  },
                                  child: Text(
                                    "${corp[index].name}  ${corp[index].surname}",
                                  ),
                                );
                              }),
                            ),
                          );
                        });
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatDetailView(
                                model: user,
                              )),
                    );
                  },
                  child: state.userRole != "personal" && state.category == 'user'
                      ? (state.userUID == state.userList?[index].userID || state.userList?[index].role == "corp")
                          ? const SizedBox()
                          : _userListTile(context, user)
                      : (state.userUID == state.userList?[index].userID || state.userList?[index].role == "personal")
                          ? const SizedBox()
                          : _userListTile(context, user)),
            ]);
          })),
    );
  }

  Column _userListTile(BuildContext context, UserModel user) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
              radius: 30, backgroundColor: context.colorScheme.onTertiary, child: circleAvatarMethod(user, context)),
          title: Row(
            children: [
              ProductText.semiBoldNormal(
                user.name.toString(),
                context: context,
              ),
              user.role == "personal" ? _assignmentStatusCard(context, user) : const SizedBox()
            ],
          ),
          subtitle: Text(
            user.message.isNotNullOrNoEmpty
                ? user.message.toString()
                : "Lorem İpsum Lorem İpsum Lorem İpsummm Lorem İpsum  Lorem İpsum  Lorem İpsum",
            overflow: TextOverflow.ellipsis,
          ),
        ),
        context.emptySizedHeightBoxLow,
        const GrayDivider(),
      ],
    );
  }

  Stack circleAvatarMethod(UserModel user, BuildContext context) {
    return Stack(
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
