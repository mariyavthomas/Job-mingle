import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:jobmingle/domin/models/appleyjob_model.dart';
import 'package:jobmingle/infrastructure/Repo/applyjob.dart';

part 'applyjob_event.dart';
part 'applyjob_state.dart';

class ApplyjobBloc extends Bloc<ApplyjobEvent, ApplyjobState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  ApplyjobBloc() : super(ApplyjobInitial()) {
    on<ApplyjobUser>(_applyjob);
    on<LoadAppliedJobs>(_getappliedjob);
  }

  FutureOr<void> _applyjob(
      ApplyjobUser event, Emitter<ApplyjobState> emit) async {
    emit(ApplyjobLoading());

    try {
      await _firestore.collection('applyjob').doc(event.applyjob.appyuid).set({
        "appyuid": event.applyjob.appyuid,
        'companyname': event.applyjob.companyname,
        'experiencecomp': event.applyjob.experiencecomp,
        'interviewtime': event.applyjob.interviewtime,
        'jobaddress': event.applyjob.jobaddress,
        'jobtiming': event.applyjob.jobtiming,
        'jobtitle': event.applyjob.jobtitle,
        'qualification': event.applyjob.qualification,
        'salary': event.applyjob.salary,
        'companyuid': event.applyjob.companyuid,
        'education': event.applyjob.education,
        'experience': event.applyjob.experience,
        'jobid': event.applyjob.jobid,
        'skills': event.applyjob.skills,
        'userid': event.applyjob.userid,
        'username': event.applyjob.username,
        'userhigereducation': event.applyjob.userhigereducation,
        'userexperence': event.applyjob.userexperence,
        'userresume': event.applyjob.userresume,
        'useruniversity': event.applyjob.useruniversity,
        'usergrade': event.applyjob.usergrade,
        'usercourse': event.applyjob.usercourse,
        'usercousestaringyear': event.applyjob.usercousestaringyear,
        'usercourseendingyear': event.applyjob.usercourseendingyear,
        'userspecialice': event.applyjob.userspecialice,
        'usermailid': event.applyjob.usermailid,
        'userphonenumber': event.applyjob.userphonenumber,
        'companyphonenumber': event.applyjob.companyphonenumber,
        'companycontactperson': event.applyjob.companycontactperson,
        'conpanycontactpersonumber': event.applyjob.conpanycontactpersonumber,
      });
      emit(AppleyedjobSuccess(appledjob:event.applyjob));
    } catch (e) {
      emit(ApplyjobFailure(error: e.toString()));
    }
  }

  FutureOr<void> _getappliedjob(LoadAppliedJobs event, Emitter<ApplyjobState> emit)async {
    emit(ApplyjobLoading());
    
    try{
      final appliedjobs = await ApplyJobRepo().getallAppliedJob();
     print(appliedjobs.length);
    emit(AppliedJobLoaded(appliedjobs));
    }catch(e){
      emit(ApplyjobFailure(error: e.toString()));

    }
  }
}
