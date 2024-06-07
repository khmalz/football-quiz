import 'package:flutter/material.dart';
import 'package:football_quiz/app/modules/category/controllers/category_controller.dart';
import 'package:football_quiz/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  void setInitialIndex(int index) {
    currentIndex.value = index;
    initController(index);
  }

  void initController(int index) {
    if (index == 0) {
      Get.lazyPut(() => CategoryController());
    } else if (index == 1) {
      Get.lazyPut(() => ProfileController());
    }
  }

  void onTabChanged(int index) {
    if (currentIndex.value != index) {
      if (currentIndex.value == 0) {
        Get.delete<CategoryController>();
      } else if (currentIndex.value == 1) {
        Get.delete<ProfileController>();
      }

      initController(index);
    }

    currentIndex.value = index;
  }
}
