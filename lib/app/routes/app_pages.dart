import 'package:get/get.dart';

import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_view.dart';
import '../modules/level/bindings/level_binding.dart';
import '../modules/level/views/level_view.dart';
import '../modules/quiz/bindings/quiz_binding.dart';
import '../modules/quiz/views/quiz_view.dart';
import '../modules/score/bindings/score_binding.dart';
import '../modules/score/views/score_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CATEGORY;

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
    GetPage(
      name: _Paths.CATEGORY,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.LEVEL,
      page: () => const LevelView(),
      binding: LevelBinding(),
    ),
  ];
}
