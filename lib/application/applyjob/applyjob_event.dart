part of 'applyjob_bloc.dart';

class ApplyjobEvent extends Equatable {
  ApplyjobEvent();

  @override
  List<Object> get props => [];

  get applyjob => null;
}

class ApplyjobUser extends ApplyjobEvent {
  final AppliedJobModel applyjob;

  ApplyjobUser({required this.applyjob});

  @override
  List<Object> get props => [applyjob];
}

class LoadAppliedJobs extends ApplyjobEvent {}
