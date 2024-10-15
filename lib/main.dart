import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sgmasms/core/device/scroll_behavior.dart';
import 'package:sgmasms/core/error/error_handler.dart';
import 'package:sgmasms/locator.dart';
import 'package:sgmasms/routes.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setHashUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await ErrorCodeHandler.loadErrorCodes();
  await Hive.initFlutter();
  setupLocator();
  // SecondTaskCode
  secondTaskCode();
  // ThirdTaskCode
  thirdTaskCode();
  runApp(const StartApp());
}

secondTaskCode() {
  List<String> inputList = [
    "P",
    "P",
    "P",
    "P",
    "WE",
    "WE",
    "N",
    "N",
    "N",
    "N",
    "N",
    "S",
    "S",
    "P",
    "P",
    "Z"
  ];
  Map<String, dynamic> inputCount = {};

  inputList.forEach((input) {
    if (inputCount.containsKey(input)) {
      inputCount[input] = inputCount[input]! + 1;
    } else {
      inputCount[input] = 1;
    }
  });

  inputCount.removeWhere((key, value) => value == 1);

  List<String> finalList = inputCount.entries
      .map((entry) => "${entry.key}->${entry.value}")
      .toList();

  debugPrint("finalList => $finalList");
  // inputCount.forEach((value, key) {
  //   debugPrint("$value => $key");
  // });
}

thirdTaskCode() {
  List<int> intList = [3, 2, 4, 6, 1, 7, 8, 5, 9];
  var n = 6;

  List<int> subList = intList.sublist(n);

  for (var item in intList) {
    if (!subList.contains(item)) {
      subList.add(item);
    }
  }

  debugPrint("subList => $subList");
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.router,
      title: "Demo",
      scrollBehavior: CustomScrollBehavior(),
      themeMode: ThemeMode.light,
    );
  }
}
