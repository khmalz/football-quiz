import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/constant/color.dart';
import 'package:football_quiz/app/data/helper/modal.dart';
import 'package:football_quiz/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/level_controller.dart';

class LevelView extends GetView<LevelController> {
  const LevelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lighterGray,
      appBar: AppBar(
        leading: ModalRoute.of(context)?.canPop == true
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_sharp,
                  size: 35,
                ),
              )
            : null,
        title: Text(
          'Select Level',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: lighterGray,
      ),
      body: FutureBuilder(
        future: controller.getLevel(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var level = snapshot.data!;

            return Stack(children: [
              GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: 5, // Ubah angka ini sesuai dengan jumlah level
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                ),
                itemBuilder: (context, index) {
                  bool isLocked = index > level["current_level"];
                  bool isDevelopment = index >= 5;

                  return GestureDetector(
                    onTap: () {
                      if (!isLocked) {
                        if (index <= level["current_level"]) {
                          controller.isClickPlayLevelAgain.value = true;
                          controller.levelClickAgain.value = index;
                        } else if (isDevelopment) {
                          controller.isClickDevelopmentLevel.value = true;
                        } else {
                          Get.toNamed(Routes.QUIZ, parameters: {
                            'level': index.toString(),
                            'category': controller.category,
                            'isPlayAgain': 'false'
                          });
                        }
                      } else {
                        controller.isClickLockLevel.value = true;
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isLocked
                            ? Colors.white
                            : Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${++index}',
                            style: TextStyle(
                              color: isLocked ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              decoration: isLocked
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              decorationColor: Colors.black,
                              decorationThickness: 3,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'Level',
                            style: TextStyle(
                              color: isLocked ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              decoration: isLocked
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              decorationColor: Colors.black,
                              decorationThickness: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Obx(() {
                if (controller.isClickLockLevel.value) {
                  return ModalWarning(
                    controllerVal: controller.isClickLockLevel,
                    message: "Level ini terkunci!",
                    icon: Icons.lock,
                  );
                } else {
                  return const SizedBox();
                }
              }),
              Obx(() {
                if (controller.isClickPlayLevelAgain.value) {
                  return ModalConfirm(
                    controllerVal: controller.isClickPlayLevelAgain,
                    message: "Apakah yakin untuk mengulang level ini?",
                    icon: Icons.restart_alt,
                    onConfirm: () {
                      Get.toNamed(Routes.QUIZ, parameters: {
                        'level': controller.levelClickAgain.toString(),
                        'category': controller.category,
                        'isPlayAgain': 'true'
                      });
                    },
                    onCancel: () {
                      controller.isClickPlayLevelAgain.value = false;
                    },
                  );
                } else {
                  return const SizedBox();
                }
              }),
              Obx(() {
                if (controller.isClickDevelopmentLevel.value) {
                  return ModalWarning(
                    controllerVal: controller.isClickDevelopmentLevel,
                    message: "Level ini masih dalam tahap pengembangan!",
                    icon: Icons.miscellaneous_services,
                  );
                } else {
                  return const SizedBox();
                }
              })
            ]);
          } else {
            return const Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}
