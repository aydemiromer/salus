part of '../chat_view.dart';

class _Tabbar extends StatelessWidget {
  const _Tabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomElevatedButton(
          width: context.dynamicWidth(.45),
          borderRadius: 10,
          color: context.colorScheme.primary,
          child: ProductText.normalGreyWithBoldOption(
            LocaleKeys.tabbar_customer.tr(),
            context: context,
          ).color(context.colorScheme.background),
        ),
        context.emptySizedWidthBoxLow,
        CustomElevatedButton(
          width: context.dynamicWidth(.45),
          borderRadius: 10,
          color: context.colorScheme.background,
          child: ProductText.normalGreyWithBoldOption(
            LocaleKeys.tabbar_professional.tr(),
            context: context,
          ),
        ),
      ],
    );
  }
}
