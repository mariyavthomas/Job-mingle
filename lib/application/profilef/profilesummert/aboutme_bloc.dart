import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobmingle/domin/models/user_model.dart';
import 'package:jobmingle/infrastructure/Repo/profile_repo.dart';

part 'aboutme_event.dart';
part 'aboutme_state.dart';

class AboutmeBloc extends Bloc<AboutmeEvent, AboutmeState> {
  AboutmeBloc(UserProfileRepo userProfileRepo) : super(AboutmeInitial()) {
    on<ProfileSummeryy>(_profilesummery);
  }

  FutureOr<void> _profilesummery(ProfileSummeryy event, Emitter<AboutmeState> emit) async{
    try{
      await UserProfileRepo().aboutme(event.profilesummery!);
     var user =await UserProfileRepo().getUser();
     emit(AboutmeSuccess(profilesummery: user!));
    }catch(e){

    }
  }
}
