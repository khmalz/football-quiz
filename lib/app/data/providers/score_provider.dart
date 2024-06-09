import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/helper/snackbar_notification.dart';
import 'package:get/get.dart';

class ScoreProvider extends GetConnect {
  Future<List<Map<dynamic, dynamic>>?> getAllScoreUser(String category) async {
    RxBool isEmpty = true.obs;

    do {
      var response = await get(
        'https://football-quiz-api.vercel.app/api/scores/get/$category',
        query: {'sum': "true"},
      );

      if (response.body != null && response.statusCode == 200) {
        var result = List<Map<String, dynamic>>.from(response.body['data']);

        debugPrint("EH SUCCESS: ${response.statusText}");

        isEmpty.value = false;

        return result;
      } else if (response.statusCode == 400) {
        isEmpty.value = false;
        snackbarNotification(message: "Bad your request");

        return null;
      } else if (response.statusCode == 404) {
        isEmpty.value = false;

        return null;
      } else {
        debugPrint("EH ERRORRRR: ${response.statusText}");
      }
    } while (isEmpty.value);

    return null;
  }

  Future<List<Map<dynamic, dynamic>>?> getSpecifiedScoreUser(
      String category) async {
    RxBool isEmpty = true.obs;

    do {
      var response = await get(
        'https://football-quiz-api.vercel.app/api/scores/get/$category',
      );

      if (response.body != null && response.statusCode == 200) {
        var result = List<Map<String, dynamic>>.from(response.body['data']);

        debugPrint("EH SUCCESS: ${response.statusText}");

        isEmpty.value = false;

        return result;
      } else if (response.statusCode == 400) {
        isEmpty.value = false;
        snackbarNotification(message: "Bad your request");

        return null;
      } else if (response.statusCode == 404) {
        isEmpty.value = false;

        return null;
      } else {
        debugPrint("EH ERRORRRR: ${response.statusText}");
      }
    } while (isEmpty.value);

    return null;
  }

  Future<Map<String, dynamic>?> postScore(
      String userId, String category, int level, int point) async {
    RxBool isEmpty = true.obs;

    do {
      var response =
          await post('https://football-quiz-api.vercel.app/api/score', {
        'id': userId,
        'category': category,
        'level': level,
        'score': point,
      });

      if (response.body != null && response.statusCode == 201) {
        debugPrint("EH SUCCESS: ${response.statusText}");
        var result = response.body['data'] as Map<String, dynamic>;

        isEmpty.value = false;
        return result;
      } else if (response.statusCode == 400) {
        isEmpty.value = false;
        snackbarNotification(message: "Bad your request");

        return null;
      } else if (response.statusCode == 406) {
        isEmpty.value = false;
        snackbarNotification(message: "Invalid level progression");

        return null;
      } else if (response.statusCode == 409) {
        isEmpty.value = false;
        snackbarNotification(message: "Invalid initial level");

        return null;
      } else if (response.statusCode == 422) {
        isEmpty.value = false;

        return {};
      } else {
        debugPrint("EH ERRORRRR: ${response.statusText}");
      }
    } while (isEmpty.value);

    return null;
  }
}
