import 'package:flutter/material.dart';
import 'package:sgmasms/core/constants/sizes.dart';
import 'package:sgmasms/core/device/utils.dart';

class AppShadowBox extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  const AppShadowBox({
    super.key,
    required this.child,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: color ??
          Theme.of(context)
              .colorScheme
              .surfaceContainerHighest
              .withOpacity(0.3),
      child: Padding(
        padding: padding ?? EdgeInsets.all(Utils.bigDv(context) ? size16 : 18),
        child: child,
      ),
    );
  }
}
