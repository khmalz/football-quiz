import 'package:football_quiz/app/modules/category/controllers/category_controller.dart';
import 'package:football_quiz/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  void onTabChanged(int i) {
    if (currentIndex.value != i) {
      if (currentIndex.value == 0) {
        Get.delete<CategoryController>();
      } else if (currentIndex.value == 1) {
        Get.delete<ProfileController>();
      }
    }

    if (i == 0 && !Get.isRegistered<CategoryController>()) {
      Get.lazyPut(() => CategoryController());
    } else if (i == 1 && !Get.isRegistered<ProfileController>()) {
      Get.lazyPut(() => ProfileController());
    }

    currentIndex.value = i;
  }
}
