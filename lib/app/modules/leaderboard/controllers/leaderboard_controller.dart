import 'package:football_quiz/app/data/providers/score_provider.dart';
import 'package:get/get.dart';

class LeaderboardController extends GetxController {
  ScoreProvider scoreProvider = ScoreProvider();

  String category = Get.arguments['category'].toString();

  Future<List<Map<dynamic, dynamic>>?> getLeaderboard() async {
    var responses = await scoreProvider.getAllScoreUser(category);

    if (responses != null) {
      return responses;
    }

    return null;
  }
}
