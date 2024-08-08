import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobmingle/domin/models/gemini.dart';
import 'package:jobmingle/infrastructure/Repo/gamani/gamani_repo.dart';

part 'gemini_bloc_event.dart';
part 'gemini_bloc_state.dart';

class GeminiBlocBloc extends Bloc<GeminiBlocEvent, GeminiBlocState> {
  GeminiBlocBloc() : super(GeminiSuccessState(msg: [])) {
    on<GeminiNewTextMessageEvent>(geminiNewTextMessageEvent);
  }

  List<GeminiModel> geminiMessages = [];

  FutureOr<void> geminiNewTextMessageEvent(
      GeminiNewTextMessageEvent event, Emitter<GeminiBlocState> emit) async {
    // Add user message to the list and emit the updated state
    final userMessage = GeminiModel(
        parts: [GeminiPartModel(text: event.inputMessage)], role: 'user');
    
    geminiMessages.add(userMessage);
    emit(GeminiSuccessState(msg: List.from(geminiMessages)));

    // Process the AI response asynchronously
    await for (String responseString in GeminiRepo.chatTextGenerationRepo(geminiMessages)) {
      if (responseString.isNotEmpty) {
        geminiMessages.add(GeminiModel(
            role: 'model', parts: [GeminiPartModel(text: responseString)]));
        emit(GeminiSuccessState(msg: List.from(geminiMessages))); // Emit with AI response
      }
    }
  }
}