part of 'get_all_jobs_bloc.dart';

sealed class GetAllJobsEvent extends Equatable {
  const GetAllJobsEvent();

  @override
  List<Object> get props => [];
}
class LoadJobs extends GetAllJobsEvent{}
class FetchJobs extends GetAllJobsEvent{
  
}
// ignore: must_be_immutable
class FilterJobsByName extends GetAllJobsEvent{
   String jobtitle;
  FilterJobsByName({required this.jobtitle});
  @override
  List<Object> get props =>[jobtitle];
}
class SearchJobEvent extends GetAllJobsEvent{
 final String ?searchtext;
  SearchJobEvent({ this.searchtext});
   @override
  List<Object> get props =>[searchtext!];
}

