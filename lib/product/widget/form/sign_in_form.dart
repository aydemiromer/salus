import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:salus/product/init/language/locale_keys.g.dart';

import '../../../core/utility/padding/page_padding.dart';
import '../../../core/utility/size/widget_size.dart';
import '../../../core/widget/button/loading_button.dart';

typedef SignInSuccess = Future<void> Function(String email, String password);

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key, required this.onSuccses}) : super(key: key);

  final SignInSuccess onSuccses;

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool isFirstValidate = false;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: !isFirstValidate ? AutovalidateMode.disabled : AutovalidateMode.always,
      child: Column(
        children: [
          _emailTextFormField(context),
          const SizedBox(height: WidgetSizes.spacingL),
          _passwordTextFormField(context),
          const SizedBox(
            height: WidgetSizes.spacingL,
          ),
          _signInButton(context)
        ],
      ),
    );
  }

  void _updateView() {
    setState(() {});
  }

  void _changePasswordFieldVisibilty() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget _signInButton(BuildContext context) {
    return LoadingElevetedButton(
      style: ElevatedButton.styleFrom(
          padding: const PagePadding.all(), shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius)),
      onPressed: () async {
        if (_formKey.currentState?.validate() ?? false) {
         
          await widget.onSuccses(_emailController.text, _passwordController.text);
          
        } else {
          setState(() {
            isFirstValidate = true;
          });
        }
      },
      title: "Login",
    );
  }

  TextFormField _passwordTextFormField(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      onChanged: (text) {
        _updateView();
      },
      autofillHints: const [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: InkWell(
            customBorder: const CircleBorder(),
            onTap: _changePasswordFieldVisibilty,
            child: Icon(_obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash),
          ),
          border: OutlineInputBorder(borderRadius: context.lowBorderRadius),
          label:  Text(LocaleKeys.auth_password.tr())),
      //validator: (value) => (value ?? '').isValidPassword ? null : "hata",
    );
  }

  TextFormField _emailTextFormField(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      onChanged: (text) {
        _updateView();
      },
      autofillHints: const [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email_outlined),
          border: OutlineInputBorder(borderRadius: context.lowBorderRadius),
          label:  Text(LocaleKeys.auth_email.tr())),
      validator: (value) => (value ?? '').isValidEmail ? null : "",
    );
  }
}
