import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/helper/get_user_from_storage.dart';
import 'package:football_quiz/app/data/helper/snackbar_notification.dart';
import 'package:football_quiz/app/data/helper/storage_user_data.dart';
import 'package:football_quiz/app/data/helper/validate_string.dart';
import 'package:football_quiz/app/data/models/user_model.dart';
import 'package:football_quiz/app/data/providers/user_provider.dart';
import 'package:football_quiz/app/modules/home/controllers/home_controller.dart';
import 'package:football_quiz/app/modules/home/views/home_view.dart';
import 'package:football_quiz/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  RxBool isClickLogout = false.obs;
  RxBool isLoading = false.obs;
  UserProvider userProvider = UserProvider();

  late Rx<User> user;

  @override
  void onInit() {
    user = getUserFromStorage().obs;

    super.onInit();
  }

  late TextEditingController usernameInput =
      TextEditingController(text: user.value.username);
  late TextEditingController nameInput =
      TextEditingController(text: user.value.name);
  Rxn<String> errorUsername = Rxn<String>(null);
  Rxn<String> errorName = Rxn<String>(null);

  bool validateRegisUsername() {
    return validateString(
      text: usernameInput.text,
      minLength: 3,
      maxLength: 10,
      errorMessage: errorUsername,
      emptyMessage: 'Username cannot be empty',
      minLengthMessage: 'Username must be at least 3 characters',
      maxLengthMessage: 'Username must be at most 10 characters',
    );
  }

  bool validateRegisName() {
    return validateString(
      text: nameInput.text,
      minLength: 3,
      maxLength: 100,
      errorMessage: errorName,
      emptyMessage: 'Name cannot be empty',
      minLengthMessage: 'Name must be at least 3 characters',
      maxLengthMessage: 'Name must be at most 100 characters',
    );
  }

  void updateUser() async {
    String id = user.value.id!;
    String username = usernameInput.text;
    String name = nameInput.text;

    if (id.isNotEmpty && username.isNotEmpty && name.isNotEmpty) {
      isLoading.value = true;
      var res = await userProvider.updateUser(
        id,
        username,
        name,
      );

      if (res != null) {
        await storeUserToStorage(res);

        clearInput();
        user = getUserFromStorage().obs;

        Get.offAll(() => const HomeView(initialIndex: 1));
        Get.lazyPut<HomeController>(() => HomeController());

        snackbarNotification(
          message: 'Profile has been updated',
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 1, milliseconds: 500),
        );
      }

      isLoading.value = false;
    }
  }

  late TextEditingController passwordOldInput = TextEditingController();
  late TextEditingController passwordNewInput = TextEditingController();
  Rxn<String> errorPasswordOld = Rxn<String>(null);
  Rxn<String> errorPasswordNew = Rxn<String>(null);

  RxBool isHidePasswordOld = true.obs;
  RxBool isHidePasswordNew = true.obs;

  bool validateNewPassword() {
    return validateString(
      text: passwordNewInput.text,
      minLength: 6,
      errorMessage: errorPasswordNew,
      emptyMessage: 'New password cannot be empty',
      minLengthMessage: 'New password must be at least 6 characters',
    );
  }

  Future<void> changePassword() async {
    String username = user.value.username!;
    String passwordOld = passwordOldInput.text;
    String passwordNew = passwordNewInput.text;

    if (username.isNotEmpty && passwordOld.isNotEmpty) {
      isLoading.value = true;
      var res = await userProvider.changePassword(
        user.value.id!,
        passwordOld,
        passwordNew,
      );

      if (res != null) {
        await storeUserToStorage(res);

        clearInput();
        user = getUserFromStorage().obs;

        Get.offAll(() => const HomeView(initialIndex: 1));
        Get.lazyPut<HomeController>(() => HomeController());

        snackbarNotification(
          message: 'Password changed successfully',
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 1, milliseconds: 500),
        );
      }

      isLoading.value = false;
    }
  }

  void clearInput() {
    usernameInput.clear();
    nameInput.clear();

    errorUsername.value = null;
    errorName.value = null;

    passwordOldInput.clear();
    passwordNewInput.clear();

    errorPasswordOld.value = null;
    errorPasswordNew.value = null;
  }

  void logout() {
    final box = GetStorage();

    user.value = User();
    box.erase();

    Get.offAllNamed(Routes.AUTHENTICATION);
  }
}
