import 'package:flutter/material.dart';
import 'package:sgmasms/core/constants/sizes.dart';

class AppDataTable extends StatelessWidget {
  final Widget child;
  final ScrollController? scrollContrl;
  const AppDataTable({
    super.key,
    required this.child,
    this.scrollContrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollContrl,
      thumbVisibility: false,
      thickness: 7,
      radius: const Radius.circular(borderRadius500),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: scrollContrl,
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(bottom: size16),
          child: child,
        ),
      ),
    );
  }
}
