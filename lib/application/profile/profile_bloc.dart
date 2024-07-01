import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:jobmingle/domin/models/user_model.dart';
import 'package:jobmingle/infrastructure/Repo/profile_repo.dart';
import 'package:equatable/equatable.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
final  UserProfileRepo userprofilrrepo;
 final imageurl="https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fvectors%2Fblank-profile-picture-mystery-man-973460%2F&psig=AOvVaw0B6FsRF9gDGW8njle5S92J&ust=1717064531634000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCODKh6y8tIYDFQAAAAAdAAAAABAE";
  ProfileBloc(this.userprofilrrepo) : super(ProfileInitial()) {
    on<GetUserEvent>(_profileget);
  //  on<ProfileEditEvent>(_profileediting);
  on<PickAndUploadPdf>(_uploadpdf);
  on<UpdateIntroducation>(_introductiondetails);
  
    
  }

  FutureOr<void> _profileget(GetUserEvent event, Emitter<ProfileState> emit)async {
    emit(UserProfileLoadingState());
    try{
      var user= await UserProfileRepo().getuser();
      emit(UserProfileLoaedState(user: user!));
    }
    catch(e){
         print("error $e");
    }
  }

  // FutureOr<void> _profileediting(ProfileEditEvent event, Emitter<ProfileState> emit)async {
  //   emit(UserProfileLoadingState());
  //   try{
  //    var usermodel=Usermodel(email: event.email, name: event.name, pic: event.profileBloc, phone: event.phone,uid: event.uid);
  //   //  await UserProfileRepo().updateUser(usermodel, event.context);
  //     emit(UserProfileLoaedState(user: usermodel));
  //   }catch(e){
  //        print('error occure$e');
  //   }
  // }


  FutureOr<void> _uploadpdf(PickAndUploadPdf event, Emitter<ProfileState> emit) async{
    emit(UserProfileLoadingState());
    try{
      String? pdfUrl = await userprofilrrepo.uploadPdf(event.file);
      emit(Pdfuploadsuccess(downloadUrl: pdfUrl!));
    }catch(e){
          print("Error uploading PDF: $e");
      emit(ProfileFailer(error: e.toString()));
    }
  }

  FutureOr<void> _introductiondetails(UpdateIntroducation event, Emitter<ProfileState> emit)async {
    emit(UserProfileLoadingState());
    try{
       await UserProfileRepo().updateIntroducation(event.username, event.education, event.profileheadlines, event.experence);
       var user =await UserProfileRepo().getuser();
       print(event.username);
    }catch(e){
   print(e);
    }
  }
}
