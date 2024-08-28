import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jobmingle/application/gemini_bloc/gemini_bloc_bloc.dart';
import 'package:jobmingle/domin/models/gemini.dart';
import 'package:jobmingle/presentaion/screen/user/chatai/widget/customcolum.dart';

class GeminiFriend extends StatelessWidget {
  GeminiFriend({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GeminiBlocBloc, GeminiBlocState>(
        listener: (context, state) {
          // Handle specific events if needed
        },
        builder: (context, state) {
          if (state is GeminiSuccessState) {
            List<GeminiModel> messages = state.msg;
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://img.freepik.com/free-vector/ai-technology-microchip-background-vector-digital-transformation-concept_53876-112222.jpg?size=338&ext=jpg&ga=GA1.1.1369675164.1715299200&semt=ais",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Customcolum(messages: messages, textEditingController: textEditingController),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

