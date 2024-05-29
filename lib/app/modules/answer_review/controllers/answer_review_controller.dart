// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:football_quiz/app/modules/quiz/question_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AnswerReviewController extends GetxController {
  String level = Get.arguments['level'].toString();
  String category = Get.arguments['category'].toString();

  late final RxList<Question> questions;
  RxInt totalQuestions = 0.obs;

  RxList<RxMap<String, dynamic>> answers =
      Get.arguments['answers'] as RxList<RxMap<String, dynamic>>;

  final box = GetStorage();

  List<Question> getQuestionsFromCache() {
    // Membaca data dari GetStorage
    Map<String, dynamic>? cachedData = box.read('questionsCache');

    if (cachedData == null) {
      return [];
    }

    // Mendapatkan daftar pertanyaan dari data yang disimpan
    List<dynamic> questionsJson = cachedData['data'];

    // Mengonversi JSON ke List<Question>
    List<Question> questions =
        questionsJson.map((json) => Question.fromJson(json)).toList();

    return questions;
  }

  @override
  void onInit() {
    questions = RxList<Question>(getQuestionsFromCache());
    totalQuestions.value = questions.length;

    super.onInit();
  }

  RxInt currentIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);

  void nextPage(int lengthQuestion) {
    if (currentIndex < lengthQuestion) {
      currentIndex++;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage(int lengthQuestion) {
    if (currentIndex > 0) {
      currentIndex--;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
