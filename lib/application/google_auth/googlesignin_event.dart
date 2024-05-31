part of 'googlesignin_bloc.dart';

@immutable
sealed class GooglesigninEvent {}

 final class SigninEventwithgoogle extends GooglesigninEvent{
}
class GoogleInitial extends GooglesigninEvent{}