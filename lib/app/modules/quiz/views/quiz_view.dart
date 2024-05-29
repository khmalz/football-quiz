import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/component/radio.dart';

import 'package:get/get.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.timelapse_sharp),
                SizedBox(width: 10),
                Text('2:17'),
              ],
            ),
            Text('7/10'),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ElevatedButton(
          onPressed: () async {
            if (controller.currentIndex.value <
                controller.questions.length - 1) {
              if (controller.answers.length <= controller.currentIndex.value ||
                  controller.answers[controller.currentIndex.value].isEmpty) {
                controller.skipQuestion(controller.currentIndex.value);
              }
              controller.nextPage(controller.questions.length);
            } else {
              if (await confirm(
                context,
                title: const Text('Confirm'),
                content: const Text('Would you like to submit?'),
                textOK: const Text('Yes'),
                textCancel: const Text('No'),
              )) {
                controller.calculateScore();
              } else {
                debugPrint("pressed cancel");
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Ganti dengan warna third
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Obx(
            () => Text(
              (controller.currentIndex < controller.questions.length - 1)
                  ? 'Skip'
                  : 'Selesai',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
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
                        RadioWidget(
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
