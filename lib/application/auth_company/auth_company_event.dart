part of 'auth_company_bloc.dart';

@immutable
sealed class AuthCompanyEvent {}

class CheckLoginStatusEventCompany extends AuthCompanyEvent{}

//-----LoginEvent-------//
class LoginComapanyEvent extends AuthCompanyEvent{
  final String username;
  final String password;

LoginComapanyEvent({required this.username,required this.password});
}

//-----SignUpEvent------//
class SignUpCompany extends AuthCompanyEvent{
   final Companymodel company;
   SignUpCompany({required this.company});
  
}
class ObsecuretextcompanyEvent extends AuthCompanyEvent{
  final bool obscure;
  ObsecuretextcompanyEvent({required this.obscure});

}
class SignOutCompany extends AuthCompanyEvent{}
class LogingInitialcompanyEvent extends AuthCompanyEvent{}