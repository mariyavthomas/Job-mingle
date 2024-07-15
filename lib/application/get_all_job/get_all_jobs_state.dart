part of 'get_all_jobs_bloc.dart';

sealed class GetAllJobsState extends Equatable {
  const GetAllJobsState();
  
  @override
  List<Object> get props => [];
}

final class GetAllJobsInitial extends GetAllJobsState {}

class JobLoaded extends GetAllJobsState{
  final List<JobModel>jobs;
  JobLoaded({required this.jobs});
  @override
  List<Object> get props => [jobs];
}
class JobLoadingState extends GetAllJobsState{

}
class PostErrorState extends GetAllJobsState{
 final String error;
 PostErrorState({required this.error});
 
}

class FilteredJobLoaded extends GetAllJobsState{
  final List<JobModel> filteredjobs;
  FilteredJobLoaded({required this.filteredjobs});
 @override
  List<Object> get props => [filteredjobs];

}