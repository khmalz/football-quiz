import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/component/card_leaderboard.dart';
import 'package:football_quiz/app/data/constant/color.dart';
import 'package:football_quiz/app/data/helper/get_random_color.dart';

import 'package:get/get.dart';

import '../controllers/leaderboard_controller.dart';

class LeaderboardView extends GetView<LeaderboardController> {
  const LeaderboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  color: textSecondary,
                  child: Card(
                    color: Theme.of(context).colorScheme.primary,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 35,
                          child: Column(
                            children: [
                              Text(
                                "#1",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: textSecondary,
                                    ),
                              ),
                              const SizedBox(height: 10),
                              CircleAvatar(
                                backgroundColor: getRandomColor(),
                                radius: 45,
                                child: const Icon(
                                  Icons.sports_soccer,
                                  size: 45,
                                  color: textSecondary,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Player Name",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: textSecondary,
                                    ),
                              ),
                              Text(
                                "Score",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: textSecondary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 20,
                          child: Column(
                            children: [
                              Text(
                                "#2",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: textSecondary,
                                    ),
                              ),
                              const SizedBox(height: 10),
                              CircleAvatar(
                                backgroundColor: getRandomColor(),
                                radius: 35,
                                child: const Icon(
                                  Icons.sports_soccer,
                                  size: 35,
                                  color: textSecondary,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Player Name",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: textSecondary,
                                    ),
                              ),
                              Text(
                                "Score",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: textSecondary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 20,
                          top: 75,
                          child: Column(
                            children: [
                              Text(
                                "#3",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: textSecondary,
                                    ),
                              ),
                              const SizedBox(height: 10),
                              CircleAvatar(
                                backgroundColor: getRandomColor(),
                                radius: 30,
                                child: const Icon(
                                  Icons.sports_soccer,
                                  size: 30,
                                  color: textSecondary,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Player Name",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: textSecondary,
                                    ),
                              ),
                              Text(
                                "Score",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: textSecondary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const CardLeaderboard(
                  rank: "4",
                  name: "Player Name",
                  score: "500",
                  icon: Icons.sports_soccer,
                ),
                const SizedBox(height: 10),
                const CardLeaderboard(
                  rank: "5",
                  name: "Player Name",
                  score: "453",
                  icon: Icons.sports_soccer,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
