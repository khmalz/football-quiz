// ignore_for_file: dead_code

// import 'dart:math';

import 'package:art_sweetalert/art_sweetalert.dart';
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
        title: Text('Pilih Level',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: lighterGray,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 9, // Ubah angka ini sesuai dengan jumlah level
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
        itemBuilder: (context, index) {
          bool isLocked = index > 0;

          return GestureDetector(
            onTap: () {
              if (!isLocked) {
                Get.toNamed(Routes.QUIZ, parameters: {
                  'level': index.toString(),
                  'category': controller.category
                });
              } else {
                ArtSweetAlert.show(
                  context: context,
                  artDialogArgs: ArtDialogArgs(
                    type: ArtSweetAlertType.danger,
                    title: "Oops...",
                    text: "This level is still in development",
                  ),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: isLocked
                    ? Colors.white // Jika level terbuka
                    : Theme.of(context)
                        .colorScheme
                        .primary, // Jika level terkunci
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
    );
  }
}
