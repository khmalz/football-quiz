import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/constant/color.dart';
import 'package:football_quiz/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class RadioWidget extends StatelessWidget {
  const RadioWidget({super.key, required this.text, required this.index});
  final String text;
  final String index;

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Obx(
      () => Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: controller.selectedGender.value == index ? third : textSecondary,
        child: RadioListTile(
          value: index,
          groupValue: controller.selectedGender.value,
          onChanged: (value) => controller.onClickRadioButton(value),
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text(text,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  )),
        ),
      ),
    );
  }
}
