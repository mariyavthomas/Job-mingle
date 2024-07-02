part of 'get_all_jobs_bloc.dart';

sealed class GetAllJobsEvent extends Equatable {
  const GetAllJobsEvent();

  @override
  List<Object> get props => [];
}
class LoadJobs extends GetAllJobsEvent{}
class FetchJobs extends GetAllJobsEvent{
  
}
class FilterJobsByName extends GetAllJobsEvent{
  final JobModel selectedJob;
  FilterJobsByName({required this.selectedJob});
  @override
  List<Object> get props =>[selectedJob];
}