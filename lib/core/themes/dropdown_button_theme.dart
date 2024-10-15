import 'package:flutter/material.dart';
import 'package:sgmasms/core/themes/text_field_theme.dart';

class AppDropdownMenuTheme {
  AppDropdownMenuTheme();

  static DropdownMenuThemeData lightDropdownMenuTheme = DropdownMenuThemeData(
    inputDecorationTheme: AppTextFieldTheme.lightInputDecorationTheme,
    menuStyle: MenuStyle(
      elevation: const WidgetStatePropertyAll(4.0),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      )),
    ),
  );
  static DropdownMenuThemeData darkDropdownMenuTheme = DropdownMenuThemeData(
    inputDecorationTheme: AppTextFieldTheme.darkInputDecorationTheme,
    menuStyle: MenuStyle(
      elevation: const WidgetStatePropertyAll(4.0),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      )),
    ),
  );
}
