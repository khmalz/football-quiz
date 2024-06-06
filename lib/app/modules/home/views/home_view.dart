import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/constant/color.dart';
import 'package:football_quiz/app/modules/category/controllers/category_controller.dart';
import 'package:football_quiz/app/modules/category/views/category_view.dart';
import 'package:football_quiz/app/modules/profile/views/profile_view.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var listPage = <Widget>[
      const CategoryView(),
      const ProfileView(),
    ];

    // Inisiasi controller pertama kali
    Get.lazyPut(() => CategoryController());

    return Scaffold(
      backgroundColor: lighterGray,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Obx(
          () => AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: controller.currentIndex.value == 0
                ? lighterGray
                : textSecondary,
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.account_circle, title: 'Profile'),
        ],
        initialActiveIndex: controller.currentIndex.value,
        onTap: controller.onTabChanged,
        cornerRadius: 0,
      ),
      body: Obx(() => listPage[controller.currentIndex.value]),
    );
  }
}
