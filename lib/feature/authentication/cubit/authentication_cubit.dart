import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/login_model.dart';
import '../model/register_model.dart';
import '../service/auth_service.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthtenticationState> {
  AuthenticationCubit(this.authenticationService) : super(LoginInitial());

  final IAuthenticationService authenticationService;
  BuildContext? context;

  Future<bool?> loginCustom(String mail, String password) async {
    final response = await authenticationService.signinWithCustom(LoginModel(mail, password));
    if (response != null) {
      emit(LoginComplete(response));
      
      return true;
    }
    return null;
  }

  Future<bool?> registerUser(RegisterModel model) async {
    final response = await authenticationService.registerCustom(model);
    if (response != null) {
      await _addUserToDatabase(model, response);
      emit(LoginComplete(response));
      return true;
    }
    return null;
  }

  Future<void> _addUserToDatabase(RegisterModel model, UserCredential credential) async {}

  Future<bool?> signInWithGoogle() async {
    final response = await authenticationService.signinGoogleCustom();
    if (response != null) {
      emit(LoginComplete(response));
      return true;
    }
    return null;
  }

  Future<bool?> signInWithApple() async {
    final response = await authenticationService.signinAppleCustom();
    if (response != null) {
      emit(LoginComplete(response));
      return true;
    }
    return null;
  }
}
