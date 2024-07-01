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
class Appleyedjob extends ApplyjobState{
  AppleyedjobModel appledjob;
  Appleyedjob({required this.appledjob});
}
class ApplyjobLoading extends ApplyjobState{
  
}
