import 'package:get/get.dart';

import '../controllers/answer_review_controller.dart';

class AnswerReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnswerReviewController>(
      () => AnswerReviewController(),
    );
  }
}
