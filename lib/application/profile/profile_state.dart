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
class UploadpicSuccess extends ProfileState{
  final String userimage;
  UploadpicSuccess({required this.userimage});
  @override
  List<Object>get props=>[userimage];
}
class UploadimagefailureEvent extends ProfileEvent
{
  String error;
  UploadimagefailureEvent({  required this.error});
}
