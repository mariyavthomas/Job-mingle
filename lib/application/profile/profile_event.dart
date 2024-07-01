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
class PickAndUploadPdf extends ProfileEvent{
  final File file;
  final String uid;
  final String fileName;
  PickAndUploadPdf({required this.file,required this.uid,required this.fileName});
}

// ignore: must_be_immutable
class UpdateIntroducation extends ProfileEvent{
  String username;
 
  String profileheadlines;
 UpdateIntroducation({ required this.profileheadlines,required this.username});

}
// ignore: must_be_immutable
class Educationadd extends ProfileEvent{
  String ? higereducation;
  String ? universityname;
  String ?course;
  String ?specialization;
  String ?coursetype;
  String ?courseStaringyear;
  String ?courseendingcontroller;
  String ?grade;
  Educationadd({ 
    required this.grade,
    required this.course,required this.courseStaringyear,required this.courseendingcontroller,required this.coursetype,required this.higereducation,required this.specialization,required this.universityname});

}