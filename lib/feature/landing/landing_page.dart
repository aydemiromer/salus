import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salus/product/widget/navbar/navbar_widget.dart';

import '../../core/init/socials/provider/login/services/apple_social_login.dart';
import '../../core/init/socials/provider/login/services/google_social_login.dart';
import '../authentication/service/auth_service.dart';
import '../authentication/view/login_view.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IAuthenticationService authenticationService =
        AuthenticationService(FirebaseAuth.instance, GoogleLogin(), AppleSocialLogin());
    final auth = authenticationService.authStateChanges();
    return StreamBuilder<User?>(
      stream: auth,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            return const LoginView();
          }
          return const Navbar();
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
