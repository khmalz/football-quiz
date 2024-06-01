import 'package:football_quiz/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2), checkUser);
    super.onReady();
  }

  void checkUser() async {
    final box = GetStorage();

    if (box.hasData('user')) {
      Get.offAllNamed(Routes.CATEGORY);
    } else {
      Get.offAllNamed(Routes.HOME);
    }
  }
}
