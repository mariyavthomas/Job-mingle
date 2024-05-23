part of 'auth_company_bloc.dart';

@immutable
sealed class AuthCompanyState {}

final class AuthCompanyInitial extends AuthCompanyState {}

class AuthCompanyLoading extends AuthCompanyState {}

// class Authenticatedcompany extends AuthCompanyState {
//   Company ? company;
//   Authenticatedcompany({this.company});
// }

class UnAuthenticatedcompany extends AuthCompanyState{}

// class SignupAuthSuccessCompany extends AuthCompanyState{
//    Company ? company;
//    SignupAuthSuccessCompany({ this.company});
// }