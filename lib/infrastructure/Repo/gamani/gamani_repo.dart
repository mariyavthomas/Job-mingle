import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jobmingle/domin/models/gemini.dart';
import 'package:jobmingle/infrastructure/Repo/gamani/key.dart';

class GeminiRepo {
  static Stream<String> chatTextGenerationRepo(
      List<GeminiModel> previousMessages) async* {
    try {
      Dio dio = Dio();

      final response = await dio.post(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=${geminiApikey}',
        data: {
          "contents": previousMessages.map((e) => e.toMap()).toList(),
          "generationConfig": {
            "temperature": 0.9,
            "topK": 1,
            "topP": 1,
            "maxOutputTokens": 2048,
            "stopSequences": []
          },
          "safetySettings": [
            {
              "category": "HARM_CATEGORY_HARASSMENT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_HATE_SPEECH",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            }
          ]
        },
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final String text = response.data['candidates']
            .first['content']['parts'].first['text'];
        yield text;
      } else {
        yield '';
      }
    } catch (e) {
      log(e.toString());
      yield '';
    }
  }
}
