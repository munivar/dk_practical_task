import 'package:flutter/material.dart';
import 'package:sgmasms/core/constants/sizes.dart';

class ButtonLoader extends StatelessWidget {
  final Color? color;
  final String? text;
  const ButtonLoader({super.key, this.color, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OnlyLoader(color: color),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: size8),
          child: Text(text ?? "Please wait..."),
        )
      ],
    );
  }
}

class OnlyLoader extends StatelessWidget {
  final Color? color;
  const OnlyLoader({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size16,
      width: size16,
      child: CircularProgressIndicator(
        color: color ?? Theme.of(context).colorScheme.onPrimary,
        strokeWidth: 2,
      ),
    );
  }
}
