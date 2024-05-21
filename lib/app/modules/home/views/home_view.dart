import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/component/radio.dart';
import 'package:football_quiz/app/data/constant/color.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

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
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: third,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text('Skip',
              style: TextStyle(color: textPrimary, fontSize: 16)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            width: double.infinity,
            child: Card(
              color: textSecondary,
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Text(
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        letterSpacing: 1,
                        wordSpacing: 1.4,
                      ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                RadioWidget(text: "Male", index: controller.gender[0]),
                const SizedBox(height: 10),
                RadioWidget(text: "Female", index: controller.gender[1]),
                const SizedBox(height: 10),
                RadioWidget(text: "Non-binary", index: controller.gender[2]),
                const SizedBox(height: 10),
                RadioWidget(text: "WTF", index: controller.gender[3]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
