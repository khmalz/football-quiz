import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/constant/color.dart';
import 'package:football_quiz/app/modules/quiz/controllers/quiz_controller.dart';
import 'package:get/get.dart';

class RadioWidget extends StatelessWidget {
  const RadioWidget({
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
    final QuizController controller = Get.find<QuizController>();

    return Obx(
      () => Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: (controller.answers.isNotEmpty &&
                indexQuestion < controller.answers.length &&
                controller.answers[indexQuestion]['selectedAnswer'] == option)
            ? third
            : textSecondary,
        child: RadioListTile(
          value: option,
          groupValue: (controller.answers.isNotEmpty &&
                  indexQuestion < controller.answers.length)
              ? controller.answers[indexQuestion]['selectedAnswer']
              : null,
          onChanged: (value) =>
              controller.onClickRadioButton(indexQuestion, value),
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
    );
  }
}
