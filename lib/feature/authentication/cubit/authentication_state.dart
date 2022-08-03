part of 'authentication_cubit.dart';

class LoginInitial extends AuthtenticationState {}

class LoginComplete extends AuthtenticationState {
  @override
  final UserCredential credential;
  const LoginComplete(this.credential);
}

class Uid extends AuthtenticationState {
  @override
  final String userUid;
  const Uid(this.userUid);
}

class AuthtenticationState extends Equatable {
  final String? userUid;
  final UserCredential? credential;

  const AuthtenticationState({this.userUid, this.credential});

  @override
  List<dynamic> get props => [userUid, credential];

  AuthtenticationState copyWith({String? userUid, UserCredential? credential}) {
    return AuthtenticationState(
      userUid: userUid ?? this.userUid,
      credential: credential ?? this.credential,
    );
  }
}
