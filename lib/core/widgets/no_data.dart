import 'package:flutter/material.dart';
import 'package:sgmasms/core/device/utils.dart';

class AppNoData extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? padding;
  const AppNoData({
    super.key,
    required this.text,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.only(
              top: Utils.height(context, 20),
              bottom: Utils.height(context, 20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.report_gmailerrorred_rounded,
            size: Utils.isWeb ? 92 : 108,
            color: Theme.of(context).colorScheme.outline,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Utils.width(context, 10)),
            child: Text(
              text,
              maxLines: 3,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
