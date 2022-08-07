import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:salus/product/widget/column/column_with_divider.dart';

import '../../../core/utility/padding/page_padding.dart';
import '../../../core/utility/size/widget_size.dart';
import '../../../core/widget/button/loading_button.dart';

typedef SignInSuccess = Future<void> Function(String email, String password);

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key, required this.onSuccses}) : super(key: key);

  final SignInSuccess onSuccses;

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isFirstValidate = false;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _rePasswordController;
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: !isFirstValidate ? AutovalidateMode.disabled : AutovalidateMode.always,
      child: ColumnWithSpacing(
        space: WidgetSizes.spacingL,
        children: [
          _emailTextFormField(context),
          _nameTextFormField(context),
          _surnameTextFormField(context),
          _passwordTextFormField(context),
          _rePasswordTextFormField(context),
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
      title: "Register",
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
          label: const Text("Password")),
      //validator: (value) => (value ?? '').isValidPassword ? null : "hata",
    );
  }

  TextFormField _rePasswordTextFormField(BuildContext context) {
    return TextFormField(
      controller: _rePasswordController,
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
          label: const Text("Re-Password")),
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
          label: const Text("Email")),
      validator: (value) => (value ?? '').isValidEmail ? null : "",
    );
  }

  TextFormField _nameTextFormField(BuildContext context) {
    return TextFormField(
      controller: _nameController,
      onChanged: (text) {
        _updateView();
      },
      autofillHints: const [AutofillHints.name],
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          border: OutlineInputBorder(borderRadius: context.lowBorderRadius),
          label: const Text("Name")),
      validator: (value) => (value ?? '').isValidEmail ? null : "",
    );
  }

  TextFormField _surnameTextFormField(BuildContext context) {
    return TextFormField(
      controller: _surnameController,
      onChanged: (text) {
        _updateView();
      },
      autofillHints: const [AutofillHints.name],
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          border: OutlineInputBorder(borderRadius: context.lowBorderRadius),
          label: const Text("Surname")),
      validator: (value) => (value ?? '').isValidEmail ? null : "",
    );
  }
}
