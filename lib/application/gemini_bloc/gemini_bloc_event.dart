part of 'gemini_bloc_bloc.dart';

abstract class GeminiBlocEvent extends Equatable {
  const GeminiBlocEvent();

  @override
  List<Object> get props => [];
}

class GeminiNewTextMessageEvent extends GeminiBlocEvent {
  final String inputMessage;

  const GeminiNewTextMessageEvent({required this.inputMessage});

  @override
  List<Object> get props => [inputMessage];
}
