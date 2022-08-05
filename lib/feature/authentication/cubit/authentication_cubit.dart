import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../product/state/user_context.dart';
import '../../../product/widget/navbar/navbar_widget.dart';
import '../model/login_model.dart';
import '../model/register_model.dart';
import '../service/auth_service.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthtenticationState> {
  AuthenticationCubit(this.authenticationService) : super(LoginInitial());

  final IAuthenticationService authenticationService;
  BuildContext? context;

  Future<bool?> loginCustom(String mail, String password, context) async {
    final response = await authenticationService.signinWithCustom(LoginModel(mail, password));
    if (response != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Navbar()),
      );
      emit(state.copyWith(credential: response, userUid: response.user?.uid));

      debugPrint(response.user!.uid);
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('userUID', response.user!.uid);

      

      UserContext().saveAuth(FirebaseAuth.instance);
      return true;
    }
    return null;
  }

  Future<bool?> registerUser(RegisterModel model) async {
    final response = await authenticationService.registerCustom(model);
    if (response != null) {
      await _addUserToDatabase(model, response);
      emit(state.copyWith(userUid: response.user?.uid));

      return true;
    }
    return null;
  }

  Future<void> _addUserToDatabase(RegisterModel model, UserCredential credential) async {}

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
