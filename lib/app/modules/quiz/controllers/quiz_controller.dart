import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  final List<String> gender = ["Male", "Female", "Non-binary", "WTF"];
  Rxn<String> selectedGender = Rxn<String>(null);

  void onClickRadioButton(value) {
    selectedGender.value = value;

    debugPrint(value);
  }
}
