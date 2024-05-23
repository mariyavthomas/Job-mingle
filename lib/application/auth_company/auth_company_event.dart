part of 'auth_company_bloc.dart';

@immutable
sealed class AuthCompanyEvent {}

class CheckLoginStatusEventCompany extends AuthCompanyEvent{}

//-----LoginEvent-------//
class LoginComapanyEvent extends AuthCompanyEvent{
  final String email;
  final String password;

LoginComapanyEvent({required this.email,required this.password});
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