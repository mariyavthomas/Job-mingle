import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:jobmingle/domin/models/appleyjob_model.dart';

part 'applyjob_event.dart';
part 'applyjob_state.dart';

class ApplyjobBloc extends Bloc<ApplyjobEvent, ApplyjobState> {
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  ApplyjobBloc() : super(ApplyjobInitial()) {
    on<Applyjob>(_applyjob);
  }

  FutureOr<void> _applyjob(ApplyjobEvent event, Emitter<ApplyjobState> emit)async {
  emit(ApplyjobLoading());
  try{
   await  _firestore.collection('apply').doc().set({
    //'jobid':event.
   });
  }catch(e){

  }
  }

}
