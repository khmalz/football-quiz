import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/models/score_model.dart';
import 'package:get/get.dart';

class LevelProvider extends GetConnect {
  Future<dynamic> getLevel(String userId, String category) async {
    Response response;
    RxBool isEmpty = true.obs;

    do {
      try {
        response =
            await post('https://football-quiz-api.vercel.app/api/score/get', {
          'id': userId,
          'category': category,
        });

        if (response.statusCode == 200 && response.body != null) {
          isEmpty.value = false;

          var result = response.body['data'] as Map<String, dynamic>;

          var data = {
            "current_level": result['current_level'],
            "level": Level.fromJson(result['level']),
          };

          return data;
        } else if (response.statusCode == 404) {
          isEmpty.value = false;

          return {
            "current_level": 0,
          };
        } else {
          debugPrint("EH ERRORRRR: ${response.statusText}");
        }
      } catch (e) {
        // debugPrint("Error: $e");
      }

      // Wait for 2 second before trying again
      await Future.delayed(const Duration(seconds: 2));
    } while (isEmpty.value);

    return null;
  }
}
