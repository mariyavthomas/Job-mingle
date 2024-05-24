part of 'auth_company_bloc.dart';


sealed class AuthCompanyState {}

final class AuthCompanyInitial extends AuthCompanyState {}

class AuthCompanyLoading extends AuthCompanyState {}

class Authenticatedcompany extends AuthCompanyState {
  User ? user;
  Authenticatedcompany({this.user});
}

class UnAuthenticatedcompany extends AuthCompanyState{}

// ignore: must_be_immutable
class SignupAuthSuccessCompany extends AuthCompanyState{
   User? user;
   SignupAuthSuccessCompany({ this.user});
}
class AuthenticatedErrorcomapny extends AuthCompanyState {
  String  message;
  AuthenticatedErrorcomapny({required this.message});
}
class ObsecurecompanyState extends AuthCompanyState{
  final  bool obscure;
  ObsecurecompanyState({ required this.obscure});
}