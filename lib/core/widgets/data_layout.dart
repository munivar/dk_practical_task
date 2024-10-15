import 'package:flutter/material.dart';

class AppDataLayout extends StatelessWidget {
  final String head;
  final String text;
  final Color? color;
  const AppDataLayout(
      {super.key, required this.head, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          head,
          maxLines: 2,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Colors.grey),
        ),
        Text(text,
            maxLines: 2,
            style:
                Theme.of(context).textTheme.labelLarge!.copyWith(color: color)),
      ],
    );
  }
}
