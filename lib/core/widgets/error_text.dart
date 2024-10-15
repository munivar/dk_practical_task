import 'package:flutter/material.dart';
import 'package:sgmasms/core/constants/colors.dart';

class AppErrorText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final Color? color;
  const AppErrorText(this.text, {super.key, this.maxLines, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 2,
      style: TextStyle(
        color: color ?? AppColor.errorClr,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
