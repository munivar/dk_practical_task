import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'package:sgmasms/core/constants/json.dart';

class ErrorCodeHandler {
  static Map<String, String>? _errorMessages;

  static Future<void> loadErrorCodes() async {
    final jsonString =
        await rootBundle.rootBundle.loadString(AppJson.errorCodeJson);
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    _errorMessages =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  static String getErrorMessage(String errorCode) {
    return _errorMessages?[errorCode] ?? 'Unknown error';
  }
}
