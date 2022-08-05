import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:salus/core/widget/image/custom_network_image.dart';
import 'package:salus/feature/authentication/service/auth_service.dart';
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const CustomNetworkImage(
                imageUrl: 'https://cobidu.co.uk/shared/images/general/57_mental-health_607219ac4f969.png'),
            FormInputCard(
                margin: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductText.headline1("Welcome", context: context),
                    const SizedBox(height: WidgetSizes.spacingM),
                    SignInForm(
                      onSuccses: (email, password) async {
                        await context.read<AuthenticationCubit>().loginCustom(email, password,context);
                      },
                    ),
                    context.emptySizedHeightBoxNormal
                  ],
                ))
          ],
        ),
      );
    }));
  }
}
