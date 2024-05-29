import 'package:football_quiz/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ScoreController extends GetxController {
  var level = Get.arguments["level"];
  var category = Get.arguments["category"];
  var correct = Get.arguments["correct"];
  var wrong = Get.arguments["wrong"];
  var point = Get.arguments["point"];
  var total = Get.arguments["total"];
  var completion = Get.arguments["completion"];

  void playAgain() {
    Get.offAllNamed(Routes.QUIZ, parameters: {
      'level': level,
      'category': category,
    });
  }
}
