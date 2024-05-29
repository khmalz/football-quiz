import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/enum/league.dart';
import 'package:get/get.dart';

import '../question_model.dart';

class QuestionProvider extends GetConnect {
  Future<List<Question>> getQuestion(String? category) async {
    Response response;
    RxBool isEmpty = true.obs;
    var league = category ?? League.championsleague.name;

    do {
      try {
        response = await get(
          'https://football-quiz-api.vercel.app/api/questions/category/$league',
        );

        if (response.body != null && response.statusCode == 200) {
          debugPrint("EH SUCCESS: ${response.statusText}");
          var result = response.body['data']['questions'] as List<dynamic>;

          isEmpty.value = false;
          return Question.fromJsonList(result);
        } else {
          debugPrint("EH ERRORRRR: ${response.statusText}");
        }
      } catch (e) {
        // debugPrint("Error: $e");
      }

      // Wait for 2 second before trying again
      await Future.delayed(const Duration(seconds: 2));
    } while (isEmpty.value);

    return [];
  }
}
