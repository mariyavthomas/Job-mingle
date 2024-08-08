import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobmingle/domin/models/jobmodel.dart';
import 'package:jobmingle/infrastructure/Repo/alljobrepo.dart';

part 'get_all_jobs_event.dart';
part 'get_all_jobs_state.dart';

class GetAllJobsBloc extends Bloc<GetAllJobsEvent, GetAllJobsState> {
   final AllJobRepo  allJobRepo;
  GetAllJobsBloc(this.allJobRepo) : super(GetAllJobsInitial()) {
    on<FetchJobs>(_alljob);
    on<FilterJobsByName>(_filterjobname);
    on<SearchJobEvent>(_searchjob);
  }

  Future<void> _alljob(GetAllJobsEvent event, Emitter<GetAllJobsState> emit)async {
   emit(JobLoadingState());
   try{
   final jobs= await  allJobRepo.getalljobs();
   emit(JobLoaded(jobs: jobs));
   }catch(e){
     emit(PostErrorState(error: e.toString()));
   }
  }

  Future<void> _filterjobname(FilterJobsByName event, Emitter<GetAllJobsState> emit) async {
    emit(JobLoadingState());
    try {
      print(event.jobtitle);
      if(event.jobtitle.isNotEmpty){
        List<JobModel>data =await allJobRepo.filterjobtitle(event.jobtitle);
        print(data.length);
        emit(FilteredJobLoaded(filteredjobs: data));
      }
      else{
        List<JobModel>data=  await allJobRepo.getalljobs();
        emit(FilteredJobLoaded(filteredjobs: data));
      }
    } catch (e) {
      emit(PostErrorState(error: e.toString()));
    }
  }

  FutureOr<void> _searchjob(SearchJobEvent event, Emitter<GetAllJobsState> emit) async{
  emit(JobLoadingState());
  try{
   if(event.searchtext!.isNotEmpty){
    List<JobModel> data= await allJobRepo.searchJobs(event.searchtext!);
    emit(JobLoaded(jobs: data));

   }else{
    List<JobModel>data= await allJobRepo.getalljobs();
    emit(JobLoaded(jobs: data));
   }
  }catch(e){
      emit(PostErrorState(error: e.toString()));
  }
  }
}
