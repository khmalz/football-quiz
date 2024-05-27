import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../question_model.dart';

class QuestionProvider extends GetConnect {
  Future<List<Question>> getQuestion() async {
    Response response;
    bool isEmpty = true;

    do {
      try {
        response = await get(
          'https://football-quiz-api.vercel.app/api/questions/category/championsleague',
        );

        if (response.body != null && response.statusCode == 200) {
          debugPrint("EH SUCCESS: ${response.statusText}");
          var result = response.body['data']['questions'] as List<dynamic>;
          isEmpty = false;

          return Question.fromJsonList(result);
        } else {
          debugPrint("EH ERRORRRR: ${response.statusText}");
        }
      } catch (e) {
        debugPrint("Error: $e");
      }

      // Wait for 1 second before trying again
      await Future.delayed(const Duration(seconds: 1));
    } while (isEmpty);

    return [];
  }
}
