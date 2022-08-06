import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../init/language/locale_keys.g.dart';
import '../../utils/text/product_text.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          color: context.colorScheme.onSurface,
          icon: const Icon(Icons.person_outline),
        ),
        IconButton(
          onPressed: () {},
          color: context.colorScheme.onSurface,
          icon: const Icon(Icons.notification_add),
        ),
      ],
      title: ProductText.headline2(
        LocaleKeys.appbar_title.tr(),
        context: context,
        color: context.colorScheme.secondary,
      ).fontWeight(weight: FontWeight.w600),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
