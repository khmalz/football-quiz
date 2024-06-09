import 'package:football_quiz/app/data/providers/score_provider.dart';
import 'package:get/get.dart';

class LeaderboardController extends GetxController {
  ScoreProvider scoreProvider = ScoreProvider();

  Future<List<Map<dynamic, dynamic>>?> getLeaderboard() async {
    String category = Get.arguments['category'].toString();

    var responses = await scoreProvider.getAllScoreUser(category);

    if (responses != null) {
      return responses;
    }

    return null;
  }

  Future<List<Map?>?> getLeaderboardAfterQuiz() async {
    String category = Get.arguments['category'].toString();
    String level = Get.arguments['level'].toString();

    var responses = await scoreProvider.getSpecifiedScoreUser(category);

    if (responses != null) {
      var filteredData = responses
          .map((entry) {
            // Mengembalikan entri yang hanya memiliki level yang sesuai
            var levels = entry["scores"]["levels"];
            if (levels.containsKey(level)) {
              var totalScore = levels[level]["score"]; // Menyimpan skor point

              entry["scores"]["point"] =
                  totalScore; // Menambahkan skor point ke dalam entry
              entry["scores"]["levels"] = {
                level: levels[level]
              }; // Hanya mengambil level yang diminta
              return entry;
            }
            return null;
          })
          .where((entry) => entry != null)
          .toList();

      // Mengurutkan data berdasarkan skor poin
      filteredData.sort(
          (a, b) => b!["scores"]["point"].compareTo(a!["scores"]["point"]));

      return filteredData;
    }

    return null;
  }
}
