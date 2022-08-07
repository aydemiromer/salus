import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:salus/core/widget/image/custom_network_image.dart';
import 'package:salus/feature/authentication/service/auth_service.dart';
import 'package:salus/product/constants/image/image.dart';
import 'package:salus/product/utils/text/product_text.dart';
import 'package:salus/product/widget/form/sign_up_form.dart';

import '../../../core/init/socials/provider/login/services/apple_social_login.dart';
import '../../../core/init/socials/provider/login/services/google_social_login.dart';
import '../../../core/utility/size/widget_size.dart';
import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/widget/card/form_input_card.dart';
import '../cubit/authentication_cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      return AuthenticationCubit(AuthenticationService(FirebaseAuth.instance, GoogleLogin(), AppleSocialLogin()));
    }, child: BlocBuilder<AuthenticationCubit, AuthtenticationState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: context.colorScheme.primary,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              context.emptySizedHeightBoxNormal,
              context.emptySizedHeightBoxNormal,
              context.emptySizedHeightBoxNormal,
              const CustomNetworkImage(imageUrl: ImageStatic.imageUrl),
              context.emptySizedHeightBoxNormal,
              context.emptySizedHeightBoxNormal,
              FormInputCard(
                  margin: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _registerTitle(context),
                      const SizedBox(height: WidgetSizes.spacingM),
                      SignUpForm(
                        onSuccses: (email, password, name, surname) async {
                          await context
                              .read<AuthenticationCubit>()
                              .registerUser(email, password, name, surname, context);
                        },
                      ),
                      context.emptySizedHeightBoxNormal
                    ],
                  )),
            ],
          ),
        ),
      );
    }));
  }

  ProductText _registerTitle(BuildContext context) {
    return ProductText.headline1(
      LocaleKeys.auth_register.tr(),
      context: context,
      color: context.colorScheme.onPrimary,
    );
  }
}
