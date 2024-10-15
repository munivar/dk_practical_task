import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  Utils();
  static bool get isWeb => kIsWeb;

//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  // how to use this responsive width
  // if (tabletDv(context)) {
  //    -> (<=)[equal and less than] -> query/condition
  // } else {
  //    -> (>)[greater than] -> query/condition
  // }

  static is4kDv(BuildContext context) {
    return MediaQuery.of(context).size.width <= 2565.0;
  }

  static lapBigDv(BuildContext context) {
    return MediaQuery.of(context).size.width <= 1445.0;
  }

  static laptopDv(BuildContext context) {
    return MediaQuery.of(context).size.width <= 1208.0;
  }

  static tabletDv(BuildContext context) {
    return MediaQuery.of(context).size.width <= 774.0;
  }

  static bigDv(BuildContext context) {
    return MediaQuery.of(context).size.width <= 432.0;
  }

  static mediumDv(BuildContext context) {
    return MediaQuery.of(context).size.width <= 380.0;
  }

  static smallDv(BuildContext context) {
    return MediaQuery.of(context).size.width <= 365.0;
  }

///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////

  // responsive sizedbox
  static SizedBox sizedBox(
      BuildContext context, double? height, double? width) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
        height: height == null ? null : screenHeight * (height / 100.0),
        width: width == null ? null : screenWidth * (width / 100.0));
  }

  // responsive height
  static double height(BuildContext context, double height) {
    final screenHeight = MediaQuery.of(context).size.height;
    return screenHeight * (height / 100.0);
  }

  // responsive width
  static double width(BuildContext context, double width) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * (width / 100.0);
  }

///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  static double pixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  static double statusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double bottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  static double appBarHeight() {
    return kToolbarHeight;
  }

  static double keyboardHeight(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    return viewInsets.bottom;
  }

  static Future<bool> isKeyboardVisible(BuildContext context) async {
    final viewInsets = MediaQuery.of(context).viewInsets;
    return viewInsets.bottom > 0;
  }

  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  static Future<void> setPreferredOrientations(
      List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  static String currentRoute(BuildContext context) {
    return GoRouterState.of(context).uri.toString();
  }

  static Color boxColor(BuildContext context) {
    return Theme.of(context)
        .colorScheme
        .surfaceContainerHighest
        .withOpacity(0.3);
  }

  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static launchURL(String url, {String? webOnlyWindowName}) async {
    await launchUrl(Uri.parse(url),
        webOnlyWindowName: webOnlyWindowName ?? "_blank",
        mode: LaunchMode.platformDefault);
  }
}

// responsive height, width and font
// extension ResponsiveSizeExtension on num {
//   double get h {
//     double screenHeight = MediaQueryData.fromView(
//             WidgetsBinding.instance.platformDispatcher.implicitView!)
//         .size
//         .height;
//     return screenHeight * (this / 100);
//   }

//   double get w {
//     double screenWidth = MediaQueryData.fromView(
//             WidgetsBinding.instance.platformDispatcher.implicitView!)
//         .size
//         .width;
//     return screenWidth * (this / 100);
//   }

//   double get sp {
//     double textScaleFactor = MediaQueryData.fromView(
//             WidgetsBinding.instance.platformDispatcher.implicitView!)
//         // ignore: deprecated_member_use
//         .textScaleFactor;
//     return textScaleFactor * this;
//   }
// }
