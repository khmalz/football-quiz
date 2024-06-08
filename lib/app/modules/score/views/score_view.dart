import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/constant/color.dart';

import 'package:get/get.dart';

import '../controllers/score_controller.dart';

class ScoreView extends GetView<ScoreController> {
  const ScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 0),
            color: Theme.of(context).colorScheme.primary,
            child: AvatarGlow(
              curve: Curves.easeInOut,
              glowRadiusFactor: 0.5,
              child: Material(
                elevation: 10,
                shape: const CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  radius: 55,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your Score',
                        style: TextStyle(
                          fontSize: 15.5,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        '${controller.point} Pt',
                        style: TextStyle(
                          fontSize: 28,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${controller.completion}/${controller.total}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: textSecondary,
                          ),
                        ),
                        const Text(
                          'Completion',
                          style: TextStyle(
                            fontSize: 18,
                            color: textSecondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                      child: VerticalDivider(
                        color: textSecondary,
                        thickness: 2,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "${controller.correct}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: textSecondary,
                          ),
                        ),
                        const Text(
                          'Correct',
                          style: TextStyle(
                            fontSize: 18,
                            color: textSecondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                      child: VerticalDivider(
                        color: textSecondary,
                        thickness: 2,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "${controller.wrong}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: textSecondary,
                          ),
                        ),
                        const Text(
                          'Wrong',
                          style: TextStyle(
                            fontSize: 18,
                            color: textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: controller.playAgain,
                      child: const Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.amber,
                            minRadius: 25,
                            maxRadius: 30,
                            child: Icon(
                              Icons.refresh,
                              color: textSecondary,
                              size: 35,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Play Again',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: controller.reviewAnswer,
                      child: const Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.brown,
                            minRadius: 25,
                            maxRadius: 30,
                            child: Icon(
                              Icons.remove_red_eye,
                              color: textSecondary,
                              size: 35,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Review Answer',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (controller.point < 50 &&
                            controller.isPlayAgain.toString() == "false") {
                          ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.warning,
                              title: "Oops...",
                              text:
                                  "Your score not reached the minimum, please try again",
                            ),
                          );
                        } else if (int.parse(controller.level) < 2) {
                          controller.nextLevel();
                        } else {
                          ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.danger,
                              title: "Oops...",
                              text: "The next level is still in development",
                            ),
                          );
                        }
                      },
                      child: const Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            minRadius: 25,
                            maxRadius: 30,
                            child: Icon(
                              Icons.skip_next,
                              color: textSecondary,
                              size: 35,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Next Level',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: controller.toHome,
                      child: const Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.indigo,
                            minRadius: 25,
                            maxRadius: 30,
                            child: Icon(
                              Icons.home,
                              color: textSecondary,
                              size: 35,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ArtSweetAlert.show(
                          context: context,
                          artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.danger,
                            title: "Oops...",
                            text: "This feature is still in development",
                          ),
                        );
                      },
                      child: const Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.deepOrange,
                            minRadius: 25,
                            maxRadius: 30,
                            child: Icon(
                              Icons.leaderboard,
                              color: textSecondary,
                              size: 35,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Leaderboard',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
