import 'package:flutter/material.dart';

enum ColorSeed {
  primary('Primary', Color(0xff122780)),
  // primary('Primary', Color(0xff6750a4)),
  teal('Teal', Colors.teal),
  indigo('Indigo', Colors.indigo),
  // blue('Blue', Colors.blue),
  // green('Green', Colors.green),
  // yellow('Yellow', Colors.yellow),
  // orange('Orange', Colors.orange),
  // deepOrange('Deep Orange', Colors.deepOrange),
  pink('Pink', Colors.pink);

  const ColorSeed(this.label, this.color);
  final String label;
  final Color color;
}
