part of 'filter_bloc.dart';

sealed class FilterState extends Equatable {
  const FilterState();
  
  @override
  List<Object> get props => [];
}

final class FilterInitial extends FilterState {}
class FilterLoading extends FilterState{}
class FilterSuccessState extends FilterState{
   List<JobModel> filterjob=[];
  FilterSuccessState({ required this.filterjob});
  @override
  List<Object> get props => [filterjob];
}

