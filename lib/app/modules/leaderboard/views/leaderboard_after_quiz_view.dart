import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/component/card_leaderboard.dart';
import 'package:football_quiz/app/data/constant/color.dart';
import 'package:football_quiz/app/data/helper/get_random_color.dart';
import 'package:get/get.dart';
import '../controllers/leaderboard_controller.dart';

class LeaderboardAfterQuizView extends GetView<LeaderboardController> {
  const LeaderboardAfterQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getLeaderboardAfterQuiz(),
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
            var leaderboardData = snapshot.data as List<dynamic>?;
            if (leaderboardData == null || leaderboardData.isEmpty) {
              return Center(
                child: Text(
                  'Leaderboard for this category is still empty',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            }

            var topThree = leaderboardData.length > 3
                ? leaderboardData.sublist(0, 3)
                : leaderboardData;
            var others =
                leaderboardData.length > 3 ? leaderboardData.sublist(3) : [];

            return ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                              if (topThree.isNotEmpty &&
                                  topThree[0] != null) ...[
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
                                        topThree[0]['name'] ?? "Player Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: textSecondary,
                                            ),
                                      ),
                                      Text(
                                        topThree[0]['scores']['point']
                                                ?.toString() ??
                                            '0',
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
                              if (topThree.length > 1 &&
                                  topThree[1] != null) ...[
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
                                        topThree[1]['name'] ?? "Player Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: textSecondary,
                                            ),
                                      ),
                                      Text(
                                        topThree[1]['scores']['point']
                                                ?.toString() ??
                                            '0',
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
                              if (topThree.length > 2 &&
                                  topThree[2] != null) ...[
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
                                        topThree[2]['name'] ?? "Player Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: textSecondary,
                                            ),
                                      ),
                                      Text(
                                        topThree[2]['scores']['point']
                                                ?.toString() ??
                                            '0',
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
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: others.length,
                        itemBuilder: (context, index) {
                          var player = others[index];
                          return Column(
                            children: [
                              CardLeaderboard(
                                rank: (index + 4).toString(),
                                name: player['name'] ?? "Player Name",
                                score: player['scores']['point']?.toString() ??
                                    '0',
                                icon: Icons.sports_soccer,
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text(
                'Leaderboard for this category is still empty',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          }
        },
      ),
    );
  }
}
