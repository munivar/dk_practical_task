import 'package:flutter/material.dart';
import 'package:sgmasms/core/constants/sizes.dart';

class AppDetailsBox extends StatelessWidget {
  final String head;
  final String text;
  final Color? color;
  const AppDetailsBox({
    super.key,
    required this.head,
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: color,
      margin: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: color ?? Theme.of(context).colorScheme.outlineVariant,
        ),
        borderRadius: BorderRadius.circular(borderRadius12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(size12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              head,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.grey),
            ),
            Text(
              text,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
