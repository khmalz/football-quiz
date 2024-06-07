import 'dart:math';
import 'package:flutter/material.dart';

Color getRandomLightColor() {
  Random random = Random();
  int min = 20;
  int r = min + random.nextInt(256 - min);
  int g = min + random.nextInt(256 - min);
  int b = min + random.nextInt(256 - min);
  return Color.fromARGB(255, r, g, b);
}
