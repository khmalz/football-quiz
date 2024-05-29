import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:football_quiz/app/data/constant/color.dart';
import 'package:football_quiz/app/modules/answer_review/controllers/answer_review_controller.dart';

class RadioViewWidget extends StatelessWidget {
  const RadioViewWidget({
    super.key,
    required this.text,
    required this.option,
    required this.indexQuestion,
  });

  final String text;
  final String option;
  final int indexQuestion;

  @override
  Widget build(BuildContext context) {
    final AnswerReviewController controller =
        Get.find<AnswerReviewController>();

    bool isSelected =
        controller.answers[indexQuestion]['selectedAnswer'] == option;

    bool isCorrect = controller.questions[indexQuestion].answer == option;

    bool isSkipped =
        controller.answers[indexQuestion]['selectedAnswer'] == null ||
            controller.answers[indexQuestion]['selectedAnswer'] == "";

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: isSkipped
          ? textSecondary
          : isSelected
              ? (isCorrect ? Colors.green : Colors.red)
              : textSecondary,
      child: RadioListTile(
        value: option,
        groupValue: controller.answers[indexQuestion]['selectedAnswer'],
        onChanged: null,
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
                color: isSelected ? textSecondary : textPrimary,
              ),
        ),
      ),
    );
  }
}
