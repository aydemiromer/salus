import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:salus/feature/profile/cubit/profile_cubit.dart';
import 'package:salus/product/init/language/locale_keys.g.dart';
import 'package:salus/product/mixin/user_status_mixin.dart';

import '../../../core/utility/padding/page_padding.dart';
import '../../../core/utility/size/widget_size.dart';
import '../../../core/widget/button/loading_button.dart';
import '../../../product/utils/text/product_text.dart';
import '../../chat/service/firebase_service.dart';

part 'module/profile_form.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with WidgetsBindingObserver, StateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        FireStoreService(FirebaseFirestore.instance),
      )..init(),
      child: Scaffold(
        body: _body(context),
      ),
    );
  }
}

BlocBuilder _body(BuildContext context) => BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.emptySizedHeightBoxHigh,
              _backButton(context),
              circleAvatar(context, state),
              context.emptySizedHeightBoxHigh,
              _form(context, state)
            ],
          ),
        );
      },
    );

Padding _form(BuildContext context, ProfileState state) {
  return Padding(
    padding: const PagePadding.allLow2x(),
    child: ProfileForm(
        onSuccses: (name, surname) async {
          await context.read<ProfileCubit>().updateUserProfile(name, surname, context);
        },
        state: state),
  );
}

IconButton _backButton(BuildContext context) {
  return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios));
}

Center circleAvatar(BuildContext context, ProfileState state) {
  return Center(
    child: CircleAvatar(
      radius: 75,
      backgroundColor: context.colorScheme.onTertiary,
      child: Align(
        alignment: Alignment.center,
        child: ProductText.headline1(
          '${state.name?[0]} ${state.surname?[0]} ',
          context: context,
        ).color(context.colorScheme.primary),
      ),
    ),
  );
}
