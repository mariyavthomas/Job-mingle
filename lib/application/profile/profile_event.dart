part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {
  // ProfileEvent();
  // @override
  // List<Object>get props=>[];
}
class GetUserEvent extends ProfileEvent{}

// class ProfileEditEvent extends ProfileEvent{
//   String profileBloc;
//    String name;
//   String phone;
 
//   String uid;
//   String email;
//   BuildContext context;
//   ProfileEditEvent({required this.email,required this.name,required this.phone,required this.uid,required this.context,required this.profileBloc});

// List<Object> get props=>[name,phone,profileBloc,uid];
// }
