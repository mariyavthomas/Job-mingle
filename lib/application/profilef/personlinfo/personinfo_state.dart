part of 'personinfo_bloc.dart';

sealed class PersoninfoState extends Equatable {
  const PersoninfoState();
  
  @override
  List<Object> get props => [];
}

final class PersoninfoInitial extends PersoninfoState {}
 class Personalinfoloading extends PersoninfoState{}
 class PersonalInfofailer extends PersoninfoState{
  String error;
  PersonalInfofailer({required this.error});
 }

 class Personinfosuccess extends PersoninfoState{
  Usermodel personinf;
  Personinfosuccess({required this.personinf});
 }