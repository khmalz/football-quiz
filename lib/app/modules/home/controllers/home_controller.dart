import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController usernameLoginInput = TextEditingController();
  Rxn<String> errorLoginUsername = Rxn<String>(null);

  bool validateLoginUsername() {
    if (usernameLoginInput.text.isEmpty) {
      errorLoginUsername.value = 'Username cannot be empty';
      return false;
    } else {
      errorLoginUsername.value = null;
      return true;
    }
  }

  final TextEditingController usernameRegisInput = TextEditingController();
  Rxn<String> errorRegisUsername = Rxn<String>(null);

  bool validateRegisUsername() {
    if (usernameRegisInput.text.isEmpty) {
      errorRegisUsername.value = 'Username cannot be empty';
      return false;
    } else {
      errorRegisUsername.value = null;
      return true;
    }
  }

  final TextEditingController nameRegisInput = TextEditingController();
  Rxn<String> errorRegisName = Rxn<String>(null);

  bool validateRegisName() {
    if (nameRegisInput.text.isEmpty) {
      errorRegisName.value = 'Name cannot be empty';
      return false;
    } else {
      errorRegisName.value = null;
      return true;
    }
  }
}
