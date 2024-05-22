import 'package:get/get.dart';

import '../modules/quiz/bindings/quiz_binding.dart';
import '../modules/quiz/views/quiz_view.dart';
import '../modules/score/bindings/score_binding.dart';
import '../modules/score/views/score_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SCORE;

  static final routes = [
    GetPage(
      name: _Paths.QUIZ,
      page: () => const QuizView(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: _Paths.SCORE,
      page: () => const ScoreView(),
      binding: ScoreBinding(),
    ),
  ];
}
