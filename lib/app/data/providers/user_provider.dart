import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/helper/snackbar_notification.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class UserProvider extends GetConnect {
  Future<User?> getUser(String username, String password) async {
    Response response;
    RxBool isEmpty = true.obs;

    do {
      try {
        response =
            await post('https://football-quiz-api.vercel.app/api/users/get', {
          'username': username,
          'password': password,
        });

        if (response.statusCode == 200 && response.body != null) {
          debugPrint("EH SUCCESS: ${response.statusText}");
          isEmpty.value = false;

          var result = response.body['data'] as Map<String, dynamic>;

          return User.fromJson(result);
        } else if (response.statusCode == 401) {
          isEmpty.value = false;
          snackbarNotification(message: "Incorrect username or password");

          return null;
        } else if (response.statusCode == 404) {
          isEmpty.value = false;
          snackbarNotification(message: "User not found");

          return null;
        } else {
          debugPrint("EH ERRORRRR: ${response.statusText}");
        }
      } catch (e) {
        //
      }

      // Wait for 2 second before trying again
      await Future.delayed(const Duration(seconds: 2));
    } while (isEmpty.value);

    return null;
  }

  Future<User?> addUser(String username, String name, String password) async {
    Response response;
    RxBool isEmpty = true.obs;

    do {
      try {
        response =
            await post('https://football-quiz-api.vercel.app/api/users', {
          'username': username,
          "name": name,
          'password': password,
        });

        if (response.statusCode == 201 && response.body != null) {
          debugPrint("EH SUCCESS: ${response.statusText}");
          isEmpty.value = false;

          var result = response.body['data'] as Map<String, dynamic>;

          return User.fromJson(result);
        } else if (response.statusCode == 400) {
          isEmpty.value = false;
          snackbarNotification(message: "Bad your request");

          return null;
        } else if (response.statusCode == 409) {
          isEmpty.value = false;
          snackbarNotification(message: "Username already exists");

          return null;
        } else {
          debugPrint("EH ERRORRRR: ${response.statusText}");
        }
      } catch (e) {
        //
      }

      // Wait for 2 second before trying again
      await Future.delayed(const Duration(seconds: 2));
    } while (isEmpty.value);

    return null;
  }
}
