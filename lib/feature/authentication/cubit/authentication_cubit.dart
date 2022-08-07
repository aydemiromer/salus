import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salus/feature/authentication/model/register_model.dart';
import 'package:salus/feature/authentication/view/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../product/state/user_context.dart';
import '../../../product/widget/navbar/navbar_widget.dart';
import '../model/login_model.dart';
import '../service/auth_service.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthtenticationState> {
  AuthenticationCubit(this.authenticationService) : super(LoginInitial());

  final IAuthenticationService authenticationService;
  BuildContext? context;

  Future<bool?> loginCustom(String mail, String password, context) async {
    final response = await authenticationService.signinWithCustom(LoginModel(mail, password));
    if (response != null) {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('userUID', response.user!.uid);
      
      await Future.delayed(const Duration(seconds: 1));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Navbar()),
      );
      emit(state.copyWith(credential: response, userUid: response.user?.uid));

      debugPrint(response.user!.uid);

      UserContext().saveAuth(FirebaseAuth.instance);
      return true;
    }
    return null;
  }

  Future<bool?> registerUser(String email, String password, String name, String surname, context) async {
    final response =
        await authenticationService.registerCustom(RegisterModel(name, surname, email, password), name, surname);
    if (response != null) {
      emit(state.copyWith(userUid: response.user?.uid));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );

      return true;
    }
    return null;
  }

  Future<bool?> signInWithGoogle() async {
    final response = await authenticationService.signinGoogleCustom();
    if (response != null) {
      emit(state.copyWith(credential: response, userUid: response.user?.uid));

      return true;
    }
    return null;
  }

  Future<bool?> signInWithApple() async {
    final response = await authenticationService.signinAppleCustom();
    if (response != null) {
      emit(state.copyWith(credential: response, userUid: response.user?.uid));

      return true;
    }
    return null;
  }
}
