import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/component/radio_view.dart';

import 'package:get/get.dart';

import '../controllers/answer_review_controller.dart';

class AnswerReviewView extends GetView<AnswerReviewController> {
  const AnswerReviewView({super.key});
  @override
  Widget build(BuildContext context) {
    if (controller.questions.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: const Text("Answer Revier"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: controller.currentIndex > 0
                    ? () {
                        controller.previousPage(controller.questions.length);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(150, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Previous',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              ElevatedButton(
                onPressed: controller.currentIndex <
                        controller.totalQuestions.value - 1
                    ? () {
                        controller.nextPage(controller.questions.length);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(150, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: PageView.builder(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.questions.length,
        itemBuilder: (context, index) {
          final question = controller.questions[index];

          return ListView(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                width: double.infinity,
                child: Card(
                  color: Colors.grey[200],
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    child: Text(
                      question.question!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            letterSpacing: 1,
                            wordSpacing: 1.4,
                          ),
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.questions[index].options!.length,
                  itemBuilder: (context, optionIndex) {
                    final option =
                        controller.questions[index].options![optionIndex];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RadioViewWidget(
                            text: option, option: option, indexQuestion: index),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
