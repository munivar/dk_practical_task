import 'package:flutter/material.dart';
import 'package:sgmasms/core/constants/const.dart';
import 'package:sgmasms/core/device/utils.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: FilledButton.styleFrom(
      padding: EdgeInsets.symmetric(
        vertical: Utils.isWeb ? 20 : 13,
        horizontal: 32,
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: Const.fontFamily,
        letterSpacing: 0.5,
      ),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: FilledButton.styleFrom(
      padding: EdgeInsets.symmetric(
        vertical: Utils.isWeb ? 20 : 13,
        horizontal: 32,
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: Const.fontFamily,
        letterSpacing: 0.5,
      ),
    ),
  );
}
