import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackbarNotification({
  required String message,
  Color backgroundColor = Colors.red,
  SnackPosition snackPosition = SnackPosition.TOP,
}) {
  Get.rawSnackbar(
    message: message,
    backgroundColor: backgroundColor,
    snackPosition: snackPosition,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    borderRadius: 8,
  );
}
