import 'package:football_quiz/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScoreController extends GetxController {
  var level = Get.arguments["level"];
  var category = Get.arguments["category"];
  RxList<RxMap<String, dynamic>> answers =
      Get.arguments["answers"] as RxList<RxMap<String, dynamic>>;
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

  void reviewAnswer() {
    Get.toNamed(Routes.ANSWER_REVIEW, arguments: {
      'level': level,
      'category': category,
      'answers': answers,
      'correct': correct,
      'wrong': wrong,
      'point': point,
      'total': total,
    });
  }

  void toHome() {
    final box = GetStorage();
    box.remove('questionsCache');
    box.remove('cache_$category');

    Get.offAllNamed(Routes.CATEGORY);
  }
}
