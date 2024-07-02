part of 'applyjob_bloc.dart';

sealed class ApplyjobState extends Equatable {
  const ApplyjobState();
  
  @override
  List<Object> get props => [];
}

final class ApplyjobInitial extends ApplyjobState {}
class ApplyjobFailure extends ApplyjobState{
  final String error;
  ApplyjobFailure({required this.error});
   @override
  List<Object> get props => [error];
}
class AppleyedjobSuccess extends ApplyjobState{
   final AppliedJobModel appledjob;
  AppleyedjobSuccess({required this.appledjob});
}
class ApplyjobLoading extends ApplyjobState{
  
}
class AppliedJobLoaded extends ApplyjobState{
  final List<AppliedJobModel>appliedjob;
  AppliedJobLoaded(this.appliedjob);
   @override
  List<Object> get props => [appliedjob];
}
