import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioController extends GetxController {
  late String selectedGender = gender[0];
  final List<String> gender = ["Male", "Female"];

  late String select = gender[0];

  void onClickRadioButton(value) {
    debugPrint(value);
    select = value;
    update();
  }
}
