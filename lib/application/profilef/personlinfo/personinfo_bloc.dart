import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobmingle/domin/models/user_model.dart';
import 'package:jobmingle/infrastructure/Repo/profile_repo.dart';

part 'personinfo_event.dart';
part 'personinfo_state.dart';

class PersoninfoBloc extends Bloc<PersoninfoEvent, PersoninfoState> {
  PersoninfoBloc() : super(PersoninfoInitial()) {
    on<SavePersonalinfo>(_savepersonalinfo);
  }

  FutureOr<void> _savepersonalinfo(SavePersonalinfo event, Emitter<PersoninfoState> emit) async{
    try{
     await UserProfileRepo().personalInfo(event.dob!,event.gender!,event.language!,event.email!,event.phone!);
    }catch(e){

    }
  }
}
