import 'package:flutter/material.dart';
import 'package:sgmasms/core/constants/sizes.dart';

class DialogContent extends StatelessWidget {
  final Widget child;
  const DialogContent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: dialog62, left: padding18, right: padding18),
      child: SingleChildScrollView(
        child: child,
      ),
    );
  }
}
