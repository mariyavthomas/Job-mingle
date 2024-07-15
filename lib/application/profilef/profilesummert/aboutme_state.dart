part of 'aboutme_bloc.dart';

sealed class AboutmeState extends Equatable {
  const AboutmeState();

  @override
  List<Object> get props => [];
}

final class AboutmeInitial extends AboutmeState {}

// ignore: must_be_immutable
class AboutaddFailer extends AboutmeState {
  String error;
  AboutaddFailer({required this.error});
}

class AboutLoading extends AboutmeState {}
// ignore: must_be_immutable
class AboutmeSuccess extends AboutmeState{
  Usermodel ?  profilesummery;
  AboutmeSuccess({required this.profilesummery});

}
