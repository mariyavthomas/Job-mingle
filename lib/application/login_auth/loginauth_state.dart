part of 'loginauth_bloc.dart';

@immutable
sealed class LoginauthState {
  
}

final class LoginauthInitialstate extends LoginauthState {}

class Authloading extends LoginauthState {}

// ignore: must_be_immutable
class Authenticated extends LoginauthState {
  User? user;
  Authenticated({this.user});
}

class UnAuthenticated extends LoginauthState {}

// ignore: must_be_immutable
class SignUpAuthSuccess extends LoginauthState {
  User? user;
  SignUpAuthSuccess({required this.user});
}



// ignore: must_be_immutable
class AuthenticatedError extends LoginauthState {
  String  message;
  AuthenticatedError({required this.message});
}


class ObsecureState extends LoginauthState{
  final  bool obscure;
  ObsecureState({ required this.obscure});
}