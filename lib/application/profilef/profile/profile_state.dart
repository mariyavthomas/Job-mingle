part of 'profile_bloc.dart';

@immutable
sealed class ProfileState extends Equatable{
  ProfileState();

  @override
  List<Object>get props=>[];

}
final class ProfileInitial extends ProfileState{}

class UserProfileLoadingState extends ProfileState{
 
}

// ignore: must_be_immutable
class UserProfileLoaedState extends ProfileState{
  Usermodel  user;
  UserProfileLoaedState({ required this.user});
 
  @override
  List<Object>get props=>[user];
}
class Pdfuploadsuccess extends ProfileState{
  final String downloadUrl;
  Pdfuploadsuccess({ required this.downloadUrl});
  @override
  List<Object> get props => [downloadUrl];
}
class ProfileFailer extends ProfileState{
  final String error;
  ProfileFailer({required this.error});
  @override
  List<Object> get props => [error];
}

class UserupdateintroducationState extends ProfileState{
 
}
// ignore: must_be_immutable
class EducationSucessfuly extends ProfileState{
 Usermodel education;
 EducationSucessfuly({required this.education});
}
// ignore: must_be_immutable
class IntroductionSuccessfully extends ProfileState{
  Usermodel introduction;
  IntroductionSuccessfully({ required this.introduction});
}
// ignore: must_be_immutable
class BasicdetailsState extends ProfileState{
  Usermodel basicdetails;
  BasicdetailsState({required this.basicdetails});
}





