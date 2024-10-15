import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sgmasms/core/constants/sizes.dart';
import 'package:sgmasms/core/device/utils.dart';

class DialogAppBar extends StatelessWidget {
  final String title;
  const DialogAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: size6, left: size8, right: size6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: size8, top: Utils.isWeb ? size4 : 0.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding4),
            child: IconButton(
              // isSelected: Utils.isDark(context),
              icon: const Icon(Icons.close_rounded),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
