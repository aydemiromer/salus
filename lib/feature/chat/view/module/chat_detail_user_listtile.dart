part of '../chat_detail_view.dart';

class _DetailListTile extends StatelessWidget {
  const _DetailListTile({
    Key? key,
    required this.user,
    required this.state,
  }) : super(key: key);
  final UserModel user;
  final ChatState state;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: _circleAvatar(context),
        trailing: _assignmentStatusCard(context, user, state),
        title: Row(
          children: [
            ProductText.semiBoldNormal(
              user.name.toString(),
              context: context,
            ),
          ],
        ),
        subtitle: Row(
          children: [_circleAvatarStatus(context), context.emptySizedWidthBoxLow, ProductText(user.status.toString())],
        ));
  }

  CircleAvatar _circleAvatarStatus(BuildContext context) {
    return CircleAvatar(
      radius: 5,
      backgroundColor: user.status.toString() == LocaleKeys.status_online.tr()
          ? context.colorScheme.surface
          : context.colorScheme.primary,
    );
  }

  CircleAvatar _circleAvatar(BuildContext context) {
    return CircleAvatar(
        radius: 30,
        backgroundColor: context.colorScheme.onTertiary,
        child: Align(
          alignment: Alignment.center,
          child: ProductText.semiBoldNormal(
            '${user.name?[0]} ${user.surname?[0]} ',
            context: context,
          ),
        ));
  }
}

Visibility _assignmentStatusCard(BuildContext context, UserModel user, ChatState state) {
  return Visibility(
    visible: user.assignment.toString() == "" ? false : true,
    child: SizedBox(
      child: InkWell(
        onTap: () {},
        child: Card(
          color: state.colorCondition(context, user.assignment.toString()),
          child: Padding(
            padding: const PagePadding.allLow(),
            child: ProductText(
              user.assignment.toString(),
            ).color(context.colorScheme.onSurface),
          ),
        ),
      ),
    ),
  );
}
