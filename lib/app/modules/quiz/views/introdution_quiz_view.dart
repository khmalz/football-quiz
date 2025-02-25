import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/constant/color.dart';
import 'package:football_quiz/app/modules/quiz/controllers/quiz_controller.dart';
import 'package:football_quiz/app/modules/quiz/views/quiz_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class IntrodutionQuizView extends GetView<QuizController> {
  const IntrodutionQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final user = box.read('user');

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: FutureBuilder(
        future: controller.getQuestions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: textSecondary,
              ),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  color: Colors.white,
                  child: Text(
                    "Error coy",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          }

          return Center(
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${controller.category} level ${controller.level}",
                      style:
                          const TextStyle(fontSize: 20, color: textSecondary),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello, ${user['data']['name']}",
                          style: const TextStyle(
                              fontSize: 30, color: textSecondary),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "At least 50 points to unlock the next level",
                          style: TextStyle(fontSize: 18, color: textSecondary),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80,
                  left: 20,
                  right: 20,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const QuizView()),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text(
                      "Start Game",
                      style: TextStyle(fontSize: 20, color: textSecondary),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
