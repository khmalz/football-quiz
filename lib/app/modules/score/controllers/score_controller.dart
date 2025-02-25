import 'package:football_quiz/app/data/helper/snackbar_notification.dart';
import 'package:football_quiz/app/data/providers/score_provider.dart';
import 'package:football_quiz/app/modules/leaderboard/bindings/leaderboard_binding.dart';
import 'package:football_quiz/app/modules/leaderboard/views/leaderboard_after_quiz_view.dart';
import 'package:football_quiz/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScoreController extends GetxController {
  var category = Get.arguments["category"];
  var isPlayAgain = Get.arguments["isPlayAgain"] ?? 'false';
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
    } else if (result.isNotEmpty && isPlayAgain.toString() == 'false') {
      isPlayAgain = 'true';
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

  void toLeaderboard() {
    Get.to(
      () => const LeaderboardAfterQuizView(),
      arguments: {
        'level': level,
        'category': category,
      },
      binding: LeaderboardBinding(),
    );
  }

  void nextLevel() {
    final box = GetStorage();
    box.remove('questionsCache');

    var nextLevel = int.parse(level) + 1;

    Get.offAllNamed(Routes.QUIZ, parameters: {
      'level': nextLevel.toString(),
      'category': category,
    });
  }

  void toHome() {
    final box = GetStorage();
    box.remove('questionsCache');
    box.remove('cache_$category');

    Get.offAllNamed(Routes.HOME);
  }
}
