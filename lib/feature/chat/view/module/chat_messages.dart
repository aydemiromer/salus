part of '../chat_detail_view.dart';

class _ChatMessagesState extends StatelessWidget {
  const _ChatMessagesState({ required this.model});
  final ChatModel? model;
  @override
  Widget build(BuildContext context) {
    var benimMesajimMi = model?.whoIsThis;
    if (benimMesajimMi!) {
      return Padding(
        padding: const PagePadding.allLow(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const PagePadding.allLow(),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: context.colorScheme.onTertiary),
              child: ProductText.semiBoldNormal(
                model?.message.toString() ?? '',
                context: context,
              ),
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const PagePadding.allLow(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const PagePadding.allLow(),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: context.colorScheme.onTertiary),
              child: ProductText.normalGreyWithBoldOption(
                model?.message.toString() ?? '',
                context: context,
              ),
            )
          ],
        ),
      );
    }
  }
}
