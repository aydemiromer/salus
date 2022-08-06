import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:salus/feature/authentication/view/auth_view.dart';

import '../../../core/init/socials/provider/login/services/apple_social_login.dart';
import '../../../core/init/socials/provider/login/services/google_social_login.dart';
import '../../../feature/authentication/service/auth_service.dart';
import '../../../feature/chat/cubit/chat_cubit.dart';
import '../../init/language/locale_keys.g.dart';
import '../../utils/text/product_text.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  AppBarWidget({Key? key, required this.state}) : super(key: key);
  final ChatState state;

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
          onPressed: () async {
            IAuthenticationService authenticationService =
                AuthenticationService(FirebaseAuth.instance, GoogleLogin(), AppleSocialLogin());
            await authenticationService.signOut();
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginView()),
            );
          },
          color: context.colorScheme.onSurface,
          icon: const Icon(Icons.logout),
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
