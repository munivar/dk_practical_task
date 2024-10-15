import 'package:flutter/material.dart';
import 'package:sgmasms/core/constants/sizes.dart';

class RefreshBtn extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final void Function() onPressed;
  const RefreshBtn({super.key, this.padding, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: size8),
      child: Tooltip(
        message: "Refresh",
        child: IconButton.outlined(
          onPressed: onPressed,
          icon: const Icon(Icons.rotate_right_rounded, size: size24),
        ),
      ),
      // TextButton.icon(
      //   onPressed: onPressed,
      //   icon: Icon(
      //     Icons.rotate_right_rounded,
      //     size: size22,
      //     color: Utils.tabletDv(context) ? Colors.white : null,
      //   ),
      //   label: Text(
      //     'Refresh',
      //     style: TextStyle(
      //       fontSize: size12,
      //       color: Utils.tabletDv(context) ? Colors.white : null,
      //     ),
      //   ),
      // ),
    );
  }
}
