part of '../chat_view.dart';

class MyUserList extends StatefulWidget {
  MyUserList({Key? key, required this.state}) : super(key: key);
  final ChatState state;

  @override
  State<MyUserList> createState() => _MyUserListState();
}

class _MyUserListState extends State<MyUserList> {
  List<UserModel> corp = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.background,
      height: context.dynamicHeight(.615),
      child: RefreshIndicator(
        onRefresh: () async => await context.read<ChatCubit>().getUsersFromFirebase(),
        child: ListView.builder(
            itemCount: widget.state.userList?.length ?? 0,
            itemBuilder: ((BuildContext context, index) {
              UserModel? user = widget.state.userList?[index];

              widget.state.userList?[index].role.toString() == "corp" ? corp.add(widget.state.userList?[index]) : null;

              return ColumnWithSpacing(space: 5, children: [
                InkWell(
                    onDoubleTap: () {
                      print(widget.state.userRole);
                      widget.state.userRole == "Admin" ? _showModal(context, corp, user?.userID, setState) : null;
                      setState(() {});
                    },
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatDetailView(
                                  model: user!,
                                )),
                      );
                    },
                    child: widget.state.userRole != "personal" && widget.state.category == 'user'
                        ? (widget.state.userUID == widget.state.userList?[index].userID ||
                                widget.state.userList?[index].role == "corp")
                            ? const SizedBox()
                            : _userListTile(context, user!)
                        : (widget.state.userUID == widget.state.userList?[index].userID ||
                                    widget.state.userList?[index].role == "personal") ||
                                (widget.state.userRole != "Admin" && widget.state.userList?[index].role == "corp"
                                    ? (widget.state.userList?[index].userID != widget.state.userCorpAssign)
                                    : false)
                            ? const SizedBox()
                            : _userListTile(context, user ?? UserModel())),
              ]);
            })),
      ),
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
            user.message.isNotNullOrNoEmpty ? user.message.toString() : LocaleKeys.emptyText_lorem.tr(),
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
        color: widget.state.colorCondition(context, user.assignment.toString()),
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

_showModal(BuildContext context, corp, state, setState) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: context.colorScheme.background,
          height: context.dynamicHeight(.45),
          child: Column(
            children: [
              context.emptySizedHeightBoxLow3x,
              _assignTitle(context),
              context.emptySizedHeightBoxLow3x,
              SizedBox(
                height: context.dynamicHeight(.3),
                width: context.dynamicWidth(.9),
                child: ListView.builder(
                  itemCount: corp.length,
                  itemBuilder: ((context, index) {
                    return _therapistButton(context, state, corp, index, setState);
                  }),
                ),
              ),
            ],
          ),
        );
      });
}

ProductText _assignTitle(BuildContext context) {
  return ProductText.headline3(
    LocaleKeys.title_therapists.tr(),
    context: context,
    color: context.colorScheme.primary,
  );
}

CustomElevatedButton _therapistButton(BuildContext context, state, corp, int index, setState) {
  return CustomElevatedButton(
    color: context.colorScheme.primary,
    height: context.dynamicHeight(.08),
    width: context.dynamicWidth(.9),
    borderRadius: 20,
    onPressed: () async {
      IFirebaseService? firebaseService = FireStoreService(FirebaseFirestore.instance);

      debugPrint(state.toString());
      debugPrint(corp[index].userID.toString());
      await firebaseService.corpAssign(state.toString(), corp[index].userID.toString());
      await firebaseService.setAssign(state.toString(), LocaleKeys.assignment_therapist.tr());
      setState(() {});
    },
    child: ProductText.headline3(
      "${corp[index].name}  ${corp[index].surname}",
      context: context,
      color: context.colorScheme.background,
    ),
  );
}
