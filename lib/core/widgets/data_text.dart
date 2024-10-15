import 'package:flutter/material.dart';

class AppDataText extends StatelessWidget {
  final String text;
  final int? maxLine;
  const AppDataText(this.text, {super.key, this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine ?? 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
