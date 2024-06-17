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
    await box.remove('cache_championsleague');
    await box.remove('cache_premierleague');
    await box.remove('cache_laliga');
    await box.remove('questionsCache');

    final userData = box.read('user');

    if (userData != null && userData['data'] != null) {
      int loginTime = userData['login_at'];
      int currentTime = DateTime.now().millisecondsSinceEpoch;
      int weekInMilliseconds = 7 * 24 * 60 * 60 * 1000;

      if (currentTime - loginTime > weekInMilliseconds) {
        // Jika sudah lebih dari seminggu, arahkan ke halaman autentikasi
        Get.offAllNamed(Routes.AUTHENTICATION);
      } else {
        // Jika belum lebih dari seminggu, perbarui waktu login terakhir
        userData['login_at'] = DateTime.now().millisecondsSinceEpoch;
        await box.write('user', userData);

        Get.offAllNamed(Routes.HOME);
      }
    } else {
      Get.offAllNamed(Routes.AUTHENTICATION);
    }
  }
}
