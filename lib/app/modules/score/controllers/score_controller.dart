import 'package:football_quiz/app/data/helper/snackbar_notification.dart';
import 'package:football_quiz/app/data/providers/score_provider.dart';
import 'package:football_quiz/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScoreController extends GetxController {
  var category = Get.arguments["category"];
  RxList<RxMap<String, dynamic>> answers =
      Get.arguments["answers"] as RxList<RxMap<String, dynamic>>;
  var correct = Get.arguments["correct"];
  var wrong = Get.arguments["wrong"];
  var total = Get.arguments["total"];
  var completion = Get.arguments["completion"];
  int point = Get.arguments["point"];
  String level = Get.arguments["level"];

  ScoreProvider scoreProvider = ScoreProvider();

  @override
  void onInit() {
    postScore();
    super.onInit();
  }

  Future<void> postScore() async {
    final box = GetStorage();
    final user = box.read('user');

    var result = await scoreProvider.postScore(
      user['data']['id'],
      category,
      int.parse(level),
      point,
    );

    if (result == null) {
      snackbarNotification(message: "Your score has not been saved");
      snackbarNotification(
          message:
              "Please play again and if the problem persists, please report to us");
    }
  }

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
