import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/constant/questions.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  RxList<RxMap<String, dynamic>> championsLeagueAnswer =
      <RxMap<String, dynamic>>[].obs;

  void onClickRadioButton(int indexQuestion, value) {
    if (championsLeagueAnswer.length > indexQuestion) {
      championsLeagueAnswer[indexQuestion]['selectedAnswer'] = value;
    } else {
      championsLeagueAnswer.add({'selectedAnswer': value}.obs);
    }

    debugPrint(championsLeagueAnswer.toString());
  }

  void skipQuestion(int indexQuestion) {
    if (championsLeagueAnswer.length > indexQuestion) {
      championsLeagueAnswer[indexQuestion]['selectedAnswer'] = "";
    } else {
      championsLeagueAnswer.add({'selectedAnswer': ""}.obs);
    }

    debugPrint(championsLeagueAnswer.toString());
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

    int totalQuestions = championsLeagueQuestions.length;
    double pointPerQuestion = maxScore / totalQuestions;

    for (var i = 0; i < totalQuestions; i++) {
      var userAnswer = championsLeagueAnswer[i]['selectedAnswer'];
      var correctAnswer = championsLeagueQuestions[i]['answer'];

      if (userAnswer == correctAnswer) {
        correct++;
      }
    }

    point.value = (correct * pointPerQuestion).round();
  }
}
