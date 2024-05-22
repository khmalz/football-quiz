import 'dart:math';

import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/constant/color.dart';

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
          bool isUnlocked = Random().nextInt(2) == 1;

          return GestureDetector(
            onTap: () {
              if (isUnlocked) {
                // Navigasi ke level yang dipilih
              } else {
                // Tampilkan pesan bahwa level masih terkunci
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: isUnlocked
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
                      color: isUnlocked ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      decoration: isUnlocked
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
                      color: isUnlocked ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decoration: isUnlocked
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
