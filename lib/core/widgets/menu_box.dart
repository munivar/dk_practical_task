import 'package:flutter/material.dart';
import 'package:sgmasms/core/constants/sizes.dart';
import 'package:sgmasms/core/device/utils.dart';

class MenuBox extends StatelessWidget {
  final Function()? onTap;
  final IconData icon;
  final String data;
  final Color? bgColor;
  final Color? iconColor;
  const MenuBox({
    super.key,
    required this.data,
    required this.icon,
    this.bgColor,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // focusColor: Colors.transparent,
      // hoverColor: Colors.transparent,
      // splashColor: Colors.transparent,
      // highlightColor: Colors.transparent,
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius12),
      child: Padding(
        padding: const EdgeInsets.all(size4),
        child: Column(
          children: [
            const SizedBox(height: size6),
            Material(
              color: bgColor ??
                  Theme.of(context).colorScheme.primary.withOpacity(0.18),
              borderRadius: BorderRadius.circular(borderRadius500),
              child: Padding(
                padding: const EdgeInsets.all(size10),
                child: Icon(
                  icon,
                  size: 26,
                  color: iconColor ??
                      Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            const SizedBox(height: size6),
            SizedBox(
              width: 94,
              height: 36,
              child: Text(
                data,
                maxLines: 5,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size12,
                  fontWeight: FontWeight.w500,
                  color:
                      Utils.isDark(context) ? Colors.white60 : Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
