part of 'googlesignin_bloc.dart';

@immutable
sealed class GooglesigninState {}

final class GooglesigninInitial extends GooglesigninState {}

final class Googleloading extends GooglesigninState{}
// ignore: must_be_immutable
final class Googleautherror extends GooglesigninState{
  String ? message;
  Googleautherror({required this.message});
}
final class GoogleAuthenticated extends GooglesigninState{}