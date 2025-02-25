import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/constant/color.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      title: "Football Quiz",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(),
          bodyMedium: TextStyle(),
        ).apply(
          bodyColor: textPrimary,
          displayColor: textPrimary,
        ),
        useMaterial3: true,
      ),
    ),
  );
}
