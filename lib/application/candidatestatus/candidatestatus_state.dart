part of 'candidatestatus_bloc.dart';

@immutable
sealed class CandidatestatusState {}

final class CandidatestatusInitial extends CandidatestatusState {}
class Candidatestatusloaded extends CandidatestatusState{
  final List<Map<String, dynamic>>  status;
  Candidatestatusloaded({required this.status});
}
class StatusLoading extends CandidatestatusState{}
class Statuserror extends CandidatestatusState{
  final String error;
  Statuserror({required this.error});
}