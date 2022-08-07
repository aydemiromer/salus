import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:salus/core/widget/image/custom_network_image.dart';
import 'package:salus/feature/authentication/service/auth_service.dart';
import 'package:salus/feature/authentication/view/register_view.dart';
import 'package:salus/product/constants/image/image.dart';
import 'package:salus/product/init/language/locale_keys.g.dart';
import 'package:salus/product/utils/text/product_text.dart';

import '../../../core/init/socials/provider/login/services/apple_social_login.dart';
import '../../../core/init/socials/provider/login/services/google_social_login.dart';
import '../../../core/utility/size/widget_size.dart';
import '../../../product/widget/card/form_input_card.dart';
import '../../../product/widget/form/sign_in_form.dart';
import '../cubit/authentication_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      return AuthenticationCubit(AuthenticationService(FirebaseAuth.instance, GoogleLogin(), AppleSocialLogin()));
    }, child: BlocBuilder<AuthenticationCubit, AuthtenticationState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: context.colorScheme.primary,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomNetworkImage(
                imageUrl: ImageStatic.imageUrl,
                height: context.dynamicHeight(.5),
              ),
              context.emptySizedHeightBoxNormal,
              _loginTitle(context),
              context.emptySizedHeightBoxLow,
              FormInputCard(
                  margin: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: WidgetSizes.spacingM),
                      SignInForm(
                        onSuccses: (email, password) async {
                          await context.read<AuthenticationCubit>().loginCustom(email, password, context);
                        },
                      ),
                      _registerButton(context),
                      context.emptySizedHeightBoxNormal
                    ],
                  )),
            ],
          ),
        ),
      );
    }));
  }

  ProductText _loginTitle(BuildContext context) {
    return ProductText.headline2(
      "${LocaleKeys.title_salus.tr()} ",
      context: context,
      color: context.colorScheme.background,
    );
  }

  Center _registerButton(BuildContext context) {
    return Center(
        child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterView(),
                  ));
            },
            child: Text(LocaleKeys.auth_register.tr())));
  }
}
