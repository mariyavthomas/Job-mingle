part of 'loginauth_bloc.dart';

@immutable
sealed class LoginauthEvent {
 }

class CheckLoginStatusEvent extends LoginauthEvent {}

//-----LoginEvent-------//

class LoginEvent extends LoginauthEvent {
  final String email;
  final String password;
  LoginEvent({required this.email, required this.password});
}
//-----SignUpEvent------//

class SignUpEvent extends LoginauthEvent {
  final Usermodel user;
  SignUpEvent({required this.user});
}

class ObsecuretextEvent extends LoginauthEvent {
  final bool obscure;
  ObsecuretextEvent({required this.obscure});
}

class SignOutEvent extends LoginauthEvent {}

class LogingInitialEvent extends LoginauthEvent {}
