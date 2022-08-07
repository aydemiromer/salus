part of '../profile_view.dart';

typedef SignInSuccess = Future<void> Function(String name, String surname);

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key, required this.onSuccses, required this.state}) : super(key: key);
  final ProfileState state;
  final SignInSuccess onSuccses;

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  bool isFirstValidate = false;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController? _emailController;
  TextEditingController? _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.state.name);
    _passwordController = TextEditingController(text: widget.state.surname);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: !isFirstValidate ? AutovalidateMode.disabled : AutovalidateMode.always,
      child: Column(
        children: [
          _emailTextFormField(context, widget.state),
          const SizedBox(height: WidgetSizes.spacingL),
          _passwordTextFormField(context, widget.state),
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
          await widget.onSuccses(_emailController!.text, _passwordController!.text);
          setState(() {});
        } else {
          setState(() {
            isFirstValidate = true;
          });
        }
      },
      title: "Update",
    );
  }

  TextFormField _passwordTextFormField(BuildContext context, ProfileState state) {
    return TextFormField(
      controller: _passwordController,
      onChanged: (text) {
        _updateView();
      },
      autofillHints: const [AutofillHints.name],
      keyboardType: TextInputType.name,

      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          border: OutlineInputBorder(borderRadius: context.lowBorderRadius),
          label: const Text("Surname")),
      //validator: (value) => (value ?? '').isValidPassword ? null : "hata",
    );
  }

  TextFormField _emailTextFormField(BuildContext context, ProfileState state) {
    return TextFormField(
      controller: _emailController,
      onChanged: (text) {
        _updateView();
      },
      autofillHints: const [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          border: OutlineInputBorder(borderRadius: context.lowBorderRadius),
          label: const Text("Name")),
    );
  }
}
