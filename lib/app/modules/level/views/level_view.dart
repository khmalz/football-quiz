import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/constant/color.dart';
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
          'Pilih Level',
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
                itemCount: 9, // Ubah angka ini sesuai dengan jumlah level
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                ),
                itemBuilder: (context, index) {
                  bool isLocked = index > level["current_level"];
                  bool isDevelopment = index >= 2;

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
                            'category': controller.category
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
                  return GestureDetector(
                    onTap: () => controller.isClickPlayLevelAgain.value = false,
                    child: Stack(
                      children: [
                        // Latar belakang blur
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.black
                              .withOpacity(0.5), // Gunakan warna transparan
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 1.4,
                              sigmaY: 1.4,
                            ), // Efek blur
                            child: Container(color: Colors.transparent),
                          ),
                        ),
                        // Konten informasi level terkunci di tengah-tengah
                        Positioned.fill(
                          child: Center(
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.replay,
                                    size: 64,
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    "Apakah yakin untuk mengulang level ini?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.toNamed(Routes.QUIZ, parameters: {
                                            'level': controller.levelClickAgain
                                                .toString(),
                                            'category': controller.category
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                          foregroundColor: textSecondary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        child: const Text("IYA"),
                                      ),
                                      const SizedBox(width: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          controller.isClickPlayLevelAgain
                                              .value = false;
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        child: const Text("TIDAK"),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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

class ModalWarning extends StatelessWidget {
  const ModalWarning({
    super.key,
    required this.controllerVal,
    required this.message,
    required this.icon,
  });

  final RxBool controllerVal;
  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controllerVal.value = false,
      child: Stack(
        children: [
          // Latar belakang blur
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.5), // Gunakan warna transparan
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 1.4,
                sigmaY: 1.4,
              ), // Efek blur
              child: Container(color: Colors.transparent),
            ),
          ),
          // Konten informasi level terkunci di tengah-tengah
          Positioned.fill(
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 64,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      message,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
