part of 'gemini_bloc_bloc.dart';

sealed class GeminiBlocState extends Equatable {
  const GeminiBlocState();

  @override
  List<Object> get props => [];
}

class GeminiInitial extends GeminiBlocState {}

class GeminiSuccessState extends GeminiBlocState {
  final List<GeminiModel> msg;
  final bool isGenerating; // Add this field

  GeminiSuccessState({
    required this.msg,
    this.isGenerating = false, // Default to false
  });

  @override
  List<Object> get props => [msg, isGenerating];
}