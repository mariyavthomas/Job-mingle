import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jobmingle/application/gemini_bloc/gemini_bloc_bloc.dart';
import 'package:jobmingle/domin/models/gemini.dart';

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
                          "https://img.freepik.com/free-vector/ai-technology-microchip-background-vector-digital-transformation-concept_53876-112222.jpg?size=338&ext=jpg&ga=GA1.1.1369675164.1715299200&semt=ais"),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    height: 100,
                    child: Row(
                      children: [
                        Text("Ai Friend",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: const EdgeInsets.only(
                                    bottom: 12, left: 16, right: 16),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: const Color.fromARGB(255, 0, 0, 0)
                                        .withOpacity(0.9)),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      messages[index].role == "user"
                                          ? "me"
                                          : "Ai Friend",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: messages[index].role == "user"
                                              ? Colors.amber
                                              : const Color.fromARGB(
                                                  255, 196, 116, 210)),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      messages[index].parts.first.text,
                                      style: TextStyle(
                                          height: 1.3, color: Colors.white),
                                    ),
                                  ],
                                ));
                          })),
                  Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          controller: textEditingController,
                          style: TextStyle(color: Colors.black),
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              fillColor: Colors.white,
                              hintText: "Ask Something from AI",
                              hintStyle: TextStyle(
                                  color: const Color.fromARGB(
                                      255, 133, 130, 130)),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor))),
                        )),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: () {
                            if (textEditingController.text.isNotEmpty) {
                              String text = textEditingController.text;
                              textEditingController.clear();
                              context.read<GeminiBlocBloc>().add(
                                  GeminiNewTextMessageEvent(
                                      inputMessage: text));
                            }
                          },
                          child: Center(
                            child: Icon(Icons.send, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}