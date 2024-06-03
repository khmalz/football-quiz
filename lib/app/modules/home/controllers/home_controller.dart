import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/helper/storage_user_data.dart';
import 'package:football_quiz/app/data/helper/validate_string.dart';
import 'package:football_quiz/app/data/providers/user_provider.dart';
import 'package:football_quiz/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  UserProvider userProvider = UserProvider();
  RxBool isHidePassword = true.obs;
  RxBool isLoading = false.obs;

  final TextEditingController usernameLoginInput = TextEditingController();
  final TextEditingController passwordLoginInput = TextEditingController();
  Rxn<String> errorLoginUsername = Rxn<String>(null);
  Rxn<String> errorLoginPassword = Rxn<String>(null);

  final TextEditingController usernameRegisInput = TextEditingController();
  final TextEditingController nameRegisInput = TextEditingController();
  final TextEditingController passwordRegisInput = TextEditingController();
  Rxn<String> errorRegisUsername = Rxn<String>(null);
  Rxn<String> errorRegisName = Rxn<String>(null);
  Rxn<String> errorRegisPassword = Rxn<String>(null);

  bool validateLoginUsername() {
    return validateString(
      text: usernameLoginInput.text,
      minLength: 3,
      maxLength: 10,
      errorMessage: errorLoginUsername,
      emptyMessage: 'Username cannot be empty',
      minLengthMessage: 'Username must be at least 3 characters',
      maxLengthMessage: 'Username must be at most 10 characters',
    );
  }

  bool validateLoginPassword() {
    return validateString(
      text: passwordLoginInput.text,
      minLength: 6,
      errorMessage: errorLoginPassword,
      emptyMessage: 'Password cannot be empty',
      minLengthMessage: 'Password must be at least 6 characters',
    );
  }

  bool validateRegisUsername() {
    return validateString(
      text: usernameRegisInput.text,
      minLength: 3,
      maxLength: 10,
      errorMessage: errorRegisUsername,
      emptyMessage: 'Username cannot be empty',
      minLengthMessage: 'Username must be at least 3 characters',
      maxLengthMessage: 'Username must be at most 10 characters',
    );
  }

  bool validateRegisName() {
    return validateString(
      text: nameRegisInput.text,
      minLength: 3,
      maxLength: 100,
      errorMessage: errorRegisName,
      emptyMessage: 'Name cannot be empty',
      minLengthMessage: 'Name must be at least 3 characters',
      maxLengthMessage: 'Name must be at most 100 characters',
    );
  }

  bool validateRegisPassword() {
    return validateString(
      text: passwordRegisInput.text,
      minLength: 6,
      errorMessage: errorRegisPassword,
      emptyMessage: 'Password cannot be empty',
      minLengthMessage: 'Password must be at least 6 characters',
    );
  }

  void login() async {
    bool isValid = true;
    isValid &= validateLoginUsername();
    isValid &= validateLoginPassword();

    String username = usernameLoginInput.text;
    String password = passwordLoginInput.text;

    if (isValid) {
      isLoading.value = true;
      var model = await userProvider.getUser(username, password);

      if (model != null) {
        await storeUserToStorage(model);
        Get.offAllNamed(Routes.CATEGORY);
      } else {}

      isLoading.value = false;
    }
  }

  void register() async {
    bool isValid = true;
    isValid &= validateRegisUsername();
    isValid &= validateRegisName();
    isValid &= validateRegisPassword();

    String username = usernameRegisInput.text;
    String name = nameRegisInput.text;
    String password = passwordRegisInput.text;

    if (isValid) {
      isLoading.value = true;
      var model = await userProvider.addUser(username, name, password);

      if (model != null) {
        await storeUserToStorage(model);
        Get.offAllNamed(Routes.CATEGORY);
      } else {}

      isLoading.value = false;
    }
  }
}
