import 'package:flutter/material.dart';

class AppNoImage extends StatelessWidget {
  final double? size;
  const AppNoImage({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      // Icons.hide_image_outlined,
      Icons.landscape_rounded,
      color: Theme.of(context).colorScheme.outlineVariant,
      size: size ?? 48,
    );
  }
}
