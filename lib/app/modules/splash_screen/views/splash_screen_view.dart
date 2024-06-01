import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 100,
              child: Icon(
                Icons.sports_soccer,
                size: 100,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Football Quiz",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 80),
            const CircularProgressIndicator(
              color: Colors.white,
              strokeAlign: 5,
            ),
          ],
        ),
      ),
    );
  }
}
