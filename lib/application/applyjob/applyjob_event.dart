part of 'applyjob_bloc.dart';

sealed class ApplyjobEvent extends Equatable {
  const ApplyjobEvent();

  @override
  List<Object> get props => [];
}

class Applyjob extends ApplyjobEvent{}