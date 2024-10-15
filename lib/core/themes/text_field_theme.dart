import 'package:flutter/material.dart';
import 'package:sgmasms/core/constants/colors.dart';
import 'package:sgmasms/core/constants/sizes.dart';
import 'package:sgmasms/core/device/utils.dart';

class AppTextFieldTheme {
  AppTextFieldTheme();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(width: 1, color: AppColor.errorClr),
    ),
    outlineBorder: BorderSide.none,
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(width: 2, color: AppColor.warningClr),
    ),
    contentPadding: EdgeInsets.symmetric(
        horizontal: size12, vertical: Utils.isWeb ? 13 : 10),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(width: 1, color: AppColor.errorClr),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(width: 2, color: AppColor.warningClr),
    ),
    contentPadding: EdgeInsets.symmetric(
        horizontal: size12, vertical: Utils.isWeb ? 13 : 10),
  );
}
