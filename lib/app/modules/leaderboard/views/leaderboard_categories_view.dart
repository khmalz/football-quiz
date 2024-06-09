import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:football_quiz/app/data/constant/categories.dart';
import 'package:football_quiz/app/data/constant/color.dart';
import 'package:football_quiz/app/modules/leaderboard/views/leaderboard_view.dart';

import 'package:get/get.dart';

import '../controllers/leaderboard_controller.dart';

class LeaderboardCategoriesView extends GetView<LeaderboardController> {
  const LeaderboardCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Leaderboard',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(
                    Icons.category,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Categories',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Get.dialog(
                    AlertDialog(
                      scrollable: true,
                      backgroundColor: textSecondary,
                      title: Text(
                        'Categories',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: categories
                            .map(
                              (category) => Column(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 3,
                                    color: textSecondary,
                                    child: ListTile(
                                      onTap: () {
                                        Get.to(() => const LeaderboardView());
                                      },
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                      leading: FaIcon(category['icon'],
                                          color: category['color'], size: 30),
                                      title: Text(category['title'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(fontSize: 18)),
                                    ),
                                  ),
                                  const SizedBox(height: 2.5)
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: Text(
                            'Close',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  );
                },
                child: Text(
                  'View All',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              )
            ],
          ),
          ...categories.take(7).map(
                (category) => Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                      color: textSecondary,
                      child: ListTile(
                        onTap: () {
                          Get.to(() => const LeaderboardView());
                        },
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        leading: FaIcon(category['icon'],
                            color: category['color'], size: 35),
                        title: Text(category['title'],
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 20)),
                      ),
                    ),
                    const SizedBox(height: 5)
                  ],
                ),
              )
        ],
      ),
    );
  }
}
