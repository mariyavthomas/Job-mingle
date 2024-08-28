part of 'candidatestatus_bloc.dart';

@immutable
sealed class CandidatestatusEvent {}
class Fetchstatus extends CandidatestatusEvent{}

class SearchJobEvent extends CandidatestatusEvent{
 final String ?searchtext;
  SearchJobEvent({ this.searchtext});
  
  // List<Object> get props =>[searchtext!];
}