import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/infrastructure/Repo/alljobrepo.dart';

part 'get_all_jobs_event.dart';
part 'get_all_jobs_state.dart';

class GetAllJobsBloc extends Bloc<GetAllJobsEvent, GetAllJobsState> {
  GetAllJobsBloc(AllJobRepo allJobRepo) : super(GetAllJobsInitial()) {
    on<FetchJobs>(_alljob);
    on<FilterJobsByName>(_filterjobname);
  }

  Future<void> _alljob(GetAllJobsEvent event, Emitter<GetAllJobsState> emit)async {
   emit(JobLoadingState());
   try{
   final jobs= await  AllJobRepo().getalljobs();
   emit(JobLoaded(jobs: jobs));
   }catch(e){
     emit(PostErrorState(error: e.toString()));
   }
  }

  FutureOr<void> _filterjobname(FilterJobsByName event, Emitter<GetAllJobsState> emit) async{
    emit(JobLoadingState());
    try{
     if(state is JobLoaded){
      final currentstate= state as JobLoaded;
      final filteredjobs= currentstate.jobs.where((jobs){
     return jobs.jobtitle ==event.selectedJob.jobtitle;
      }).toList();
      emit(FilteredJobLoaded(filteredjobs: filteredjobs));
     }
    }catch(e){

    }
  }
}
