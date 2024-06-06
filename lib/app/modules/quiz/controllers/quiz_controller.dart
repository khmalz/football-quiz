import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/helper/get_questions_from_cache.dart';
import 'package:football_quiz/app/modules/quiz/providers/question_provider.dart';
import 'package:football_quiz/app/modules/quiz/question_model.dart';
import 'package:football_quiz/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class QuizController extends GetxController {
  String level = Get.parameters['level'].toString();
  String category = Get.parameters['category'].toString();

  final RxList<Question> questions = <Question>[].obs;
  RxInt totalQuestions = 0.obs;

  RxList<RxMap<String, dynamic>> answers = <RxMap<String, dynamic>>[].obs;

  QuestionProvider questionProvider = QuestionProvider();

  int countCompletionQuestion() {
    return answers
        .where((answer) =>
            answer['selectedAnswer'] != null &&
            answer['selectedAnswer'].toString().isNotEmpty)
        .length;
  }

  Future<void> getQuestions() async {
    final box = GetStorage();

    if (box.hasData('questionsCache')) {
      questions.value = RxList<Question>(getQuestionsFromCache());
      totalQuestions.value = questions.length;
    } else {
      var models = await questionProvider.getQuestion(category, level);

      if (models.isNotEmpty) {
        questions.value = models;
        totalQuestions.value = models.length;

        addQuestionToCache(models);
      }
    }
  }

  void onClickRadioButton(int indexQuestion, value) {
    if (answers.length > indexQuestion) {
      answers[indexQuestion]['selectedAnswer'] = value;
    } else {
      answers.add({'selectedAnswer': value}.obs);
    }
  }

  void skipQuestion(int indexQuestion) {
    if (answers.length > indexQuestion) {
      answers[indexQuestion]['selectedAnswer'] = "";
    } else {
      answers.add({'selectedAnswer': ""}.obs);
    }
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

  RxInt point = 0.obs;

  void calculateScore() {
    int correct = 0;
    int maxScore = 100;

    double pointPerQuestion = maxScore / totalQuestions.value;

    while (answers.length < totalQuestions.value) {
      answers.add({'selectedAnswer': ""}.obs);
    }

    for (var i = 0; i < totalQuestions.value; i++) {
      var userAnswer = answers[i]['selectedAnswer'];
      var correctAnswer = questions[i].answer;

      if (userAnswer == correctAnswer) correct++;
    }

    point.value = (correct * pointPerQuestion).round();

    int completionQuestion = countCompletionQuestion();
    int wrong = completionQuestion - correct;

    Get.offAllNamed(Routes.SCORE, arguments: {
      "level": level,
      "category": category,
      "answers": answers,
      "correct": correct,
      "wrong": wrong,
      "point": point.value,
      "total": totalQuestions,
      "completion": completionQuestion,
    });
  }

  void addQuestionToCache(List<Question> questions) {
    final box = GetStorage();

    List<Map<String, dynamic>> questionsJson =
        questions.map((q) => q.toJson()).toList();

    Map<String, dynamic> dataToSave = {
      'proses': 'review',
      'category': category,
      'level': level,
      'data': questionsJson,
    };

    box.write('questionsCache', dataToSave);
  }
}
