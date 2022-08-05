part of '../chat_view.dart';

class _Tabbar extends StatefulWidget {
  _Tabbar({Key? key, required this.state}) : super(key: key);
  ChatState state;

  @override
  State<_Tabbar> createState() => _TabbarState();
}

bool? x = false;

class _TabbarState extends State<_Tabbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.onBackground,
      child: Padding(
        padding: const PagePadding.allLow(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              width: context.dynamicWidth(.45),
              borderRadius: 10,
              color: widget.state.userRole == 'Admin'
                  ? widget.state.category == "user"
                      ? context.colorScheme.primary
                      : context.colorScheme.background
                  : widget.state.userRole == 'personal'
                      ? context.colorScheme.background
                      : context.colorScheme.primary,
              child: ProductText.normalGreyWithBoldOption(
                LocaleKeys.tabbar_customer.tr(),
                context: context,
              ).color(widget.state.userRole == 'Admin'
                  ? widget.state.category == "user"
                      ? context.colorScheme.background
                      : Colors.black
                  : widget.state.userRole == 'personal'
                      ? Colors.black
                      : context.colorScheme.background),
              onPressed: () {
                widget.state.userRole == 'Admin' ? context.read<ChatCubit>().changeCategory() : null;
              },
            ),
            context.emptySizedWidthBoxLow,
            CustomElevatedButton(
              width: context.dynamicWidth(.45),
              borderRadius: 10,
              color: widget.state.userRole == 'Admin'
                  ? widget.state.category == "corp"
                      ? context.colorScheme.primary
                      : context.colorScheme.background
                  : widget.state.userRole == 'personal'
                      ? context.colorScheme.primary
                      : context.colorScheme.background,
              child: ProductText.normalGreyWithBoldOption(
                LocaleKeys.tabbar_professional.tr(),
                context: context,
              ).color(widget.state.userRole == 'Admin'
                  ? widget.state.category == "corp"
                      ? context.colorScheme.background
                      : Colors.black
                  : widget.state.userRole == 'personal'
                      ? context.colorScheme.background
                      : Colors.black),
              onPressed: () {
                widget.state.userRole == 'Admin' ? context.read<ChatCubit>().changeCategory() : null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
