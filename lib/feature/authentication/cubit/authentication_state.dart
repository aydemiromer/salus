part of 'authentication_cubit.dart';

@immutable
abstract class AuthtenticationState {}

class LoginInitial extends AuthtenticationState {}

class LoginComplete extends AuthtenticationState {
  final UserCredential credential;

  LoginComplete(this.credential);
}
