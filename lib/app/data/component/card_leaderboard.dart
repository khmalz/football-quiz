import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/constant/color.dart';
import 'package:football_quiz/app/data/helper/get_random_color.dart';

class CardLeaderboard extends StatelessWidget {
  const CardLeaderboard({
    super.key,
    required this.rank,
    required this.name,
    required this.score,
    required this.icon,
  });

  final String rank;
  final String name;
  final String score;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.grey),
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "#$rank",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: getRandomColor(),
            radius: 30,
            child: Icon(
              icon,
              size: 30,
              color: textSecondary,
            ),
          ),
        ],
      ),
      title: Text(
        name,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        "$score points",
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.normal),
      ),
    );
  }
}
