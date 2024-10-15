import 'package:flutter/material.dart';
import 'package:sgmasms/core/constants/const.dart';
import 'package:sgmasms/core/themes/checkbox_theme.dart';
import 'package:sgmasms/core/themes/dropdown_button_theme.dart';
import 'package:sgmasms/core/themes/elevated_button_theme.dart';
import 'package:sgmasms/core/themes/filled_button_theme.dart';
import 'package:sgmasms/core/themes/outlined_button_theme.dart';
import 'package:sgmasms/core/themes/text_field_theme.dart';

// Define your light theme data
ThemeData lightThemeData(Color color) {
  return ThemeData(
    colorSchemeSeed: color,
    useMaterial3: true,
    fontFamily: Const.fontFamily,
    brightness: Brightness.light,
    inputDecorationTheme: AppTextFieldTheme.lightInputDecorationTheme,
    checkboxTheme: AppCheckboxTheme.lightCheckboxTheme,
    filledButtonTheme: AppFilledButtonTheme.lightFilledButtonTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    dropdownMenuTheme: AppDropdownMenuTheme.lightDropdownMenuTheme,
  );
}

// Define your dark theme data
ThemeData darkThemeData(Color color) {
  return ThemeData(
    colorSchemeSeed: color,
    useMaterial3: true,
    fontFamily: Const.fontFamily,
    brightness: Brightness.dark,
    inputDecorationTheme: AppTextFieldTheme.darkInputDecorationTheme,
    checkboxTheme: AppCheckboxTheme.darkCheckboxTheme,
    filledButtonTheme: AppFilledButtonTheme.darkFilledButtonTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
    dropdownMenuTheme: AppDropdownMenuTheme.darkDropdownMenuTheme,
  );
}
