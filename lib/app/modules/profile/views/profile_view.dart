import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/constant/color.dart';
import 'package:football_quiz/app/data/helper/get_initial_name.dart';
import 'package:football_quiz/app/data/helper/get_random_color.dart';
import 'package:football_quiz/app/modules/profile/views/profile_edit_view.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: textSecondary,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ListTile(
              onTap: () => Get.to(() => const ProfileEditView()),
              leading: CircleAvatar(
                backgroundColor: getRandomLightColor(),
                radius: 30,
                child: Obx(() {
                  return Text(
                    getInitialName(controller.user.value.name ?? "Guest", 2),
                    style: const TextStyle(
                      color: textSecondary,
                      fontSize: 24,
                    ),
                  );
                }),
              ),
              title: Obx(
                () => Text(
                  controller.user.value.name ?? "Guest",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              trailing: const Icon(
                Icons.edit,
                color: textPrimary,
                size: 30,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(
            color: textPrimary,
            height: 20,
            thickness: 1,
          ),
          const SizedBox(height: 20),
          const ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: textPrimary,
              size: 30,
            ),
            title: Text(
              "Logout",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
