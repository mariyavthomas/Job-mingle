part of 'aboutme_bloc.dart';

sealed class AboutmeEvent extends Equatable {
  const AboutmeEvent();

  @override
  List<Object> get props => [];
}
// ignore: must_be_immutable
class ProfileSummeryy extends AboutmeEvent{
  String ?profilesummery;
  ProfileSummeryy({required this.profilesummery});
}