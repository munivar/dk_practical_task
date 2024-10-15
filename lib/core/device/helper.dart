import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sgmasms/core/constants/colors.dart';
import 'package:sgmasms/core/constants/sizes.dart';
import 'package:sgmasms/core/device/utils.dart';
import 'package:sgmasms/core/widgets/no_image.dart';

class AppHelper {
  AppHelper();

  // Format date
  static String formateDateForAPI(String date) {
    if (date.isNotEmpty) {
      try {
        final finalDate = DateTime.parse(date).toLocal();
        return DateFormat("yyyy-MM-dd").format(finalDate);
      } catch (e) {
        // Handle parsing errors, e.g., return an error message or a default value
        return "Invalid date format";
      }
    } else {
      return "";
    }
  }

  // Format date
  static String formateDate(String date) {
    if (date.isNotEmpty) {
      try {
        final finalDate = DateTime.parse(date).toLocal();
        return DateFormat("dd/MM/yyyy").format(finalDate);
      } catch (e) {
        // Handle parsing errors, e.g., return an error message or a default value
        return "Invalid date format";
      }
    } else {
      return "";
    }
  }

  // Format time
  static String formateTime(String time) {
    if (time.isNotEmpty) {
      try {
        final finalTime = DateTime.parse(time).toLocal();
        return DateFormat("hh:mm a").format(finalTime);
      } catch (e) {
        // Handle parsing errors, e.g., return an error message or a default value
        return "Invalid time format";
      }
    } else {
      return "";
    }
  }

  // Format date and time
  static String formatDateTime(String date) {
    if (date != "") {
      try {
        final finalDateTime = DateTime.parse(date).toLocal();
        // return DateFormat("EEE, dd MMM yyyy - hh:mm a").format(finalDateTime);
        return DateFormat("dd MMM, yyyy hh:mm a").format(finalDateTime);
      } catch (e) {
        // Handle parsing errors, e.g., return an error message or a default value
        return "Invalid date format";
      }
    } else {
      return "";
    }
  }

  // capitalize
  static String capitalizeName(String? name) {
    List<String> parts = name!.split(' ');
    String capitalized = '';
    for (String part in parts) {
      if (part.isNotEmpty) {
        capitalized +=
            '${part[0].toUpperCase()}${part.substring(1).toLowerCase()} ';
      }
    }
    return capitalized.trim();
  }

  // Function to format the amount
  static String formatAmountToINR(String amount) {
    if (amount.isEmpty) {
      return "₹0";
    }
    double parsedAmount;
    try {
      // Replace any commas (if present) and trim whitespace
      parsedAmount = double.parse(amount.replaceAll(',', '').trim());
    } catch (e) {
      return "Invalid amount";
    }
    final formatter = NumberFormat.currency(
      locale: 'en_IN',
      symbol: '₹',
      decimalDigits: parsedAmount == parsedAmount.toInt() ? 0 : 2,
    );
    return formatter.format(parsedAmount);
  }

  // Function to parse the formatted amount back to double
  static double parseINRAmount(String formattedAmount) {
    // Remove the currency symbol and commas
    String cleanedAmount = formattedAmount.replaceAll(RegExp(r'[₹,]'), '');
    // Parse the cleaned string to a double
    return double.parse(cleanedAmount);
  }

  // function for picking date
  static pickDate(BuildContext context, DateTime? initialDate,
      DateTime? firstDate, DateTime? endDate) async {
    try {
      DateTime? dateValue = await showDatePicker(
        context: context,
        initialDate: initialDate ?? DateTime.now(),
        firstDate: firstDate ?? DateTime(1700),
        lastDate: endDate ?? DateTime(2101),
        locale: const Locale("en"), // Specify the desired locale
      );
      return dateValue;
    } catch (e) {
      throw Exception(
          "Failed to show date picker: $e"); // Propagate the error with more information
    }
  }

  // function for picking time
  static pickTime(BuildContext context) async {
    try {
      TimeOfDay? timeValue = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (timeValue != null) {
        return timeValue;
      } else {
        throw Exception(
            "No time selected"); // Throw an error if no date is selected
      }
    } catch (e) {
      throw Exception(
          "Failed to show time picker: $e"); // Propagate the error with more information
    }
  }

  static void showDialogg(BuildContext context,
      {required Widget child, double? width}) {
    showDialog(
        context: context,
        useSafeArea: true,
        barrierDismissible: true,
        barrierColor: AppColor.blackClr.withOpacity(0.7),
        builder: (BuildContext conntext) {
          return AlertDialog(
            elevation: 5,
            alignment: Alignment.topCenter,
            insetPadding: const EdgeInsets.only(top: 100, bottom: 30),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(size16)),
            contentPadding: const EdgeInsets.all(0.0),
            content: SizedBox(
              width: width ?? Utils.width(context, 70),
              child: child,
            ),
          );
        });
  }

  static void showModelBottomSheett(BuildContext context,
      {required Widget child, double? height, double? width}) {
    showModalBottomSheet(
      showDragHandle: false,
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) async {
            if (await Utils.isKeyboardVisible(context)) {
              // Keyboard is open, close it
              // ignore: use_build_context_synchronously
              Utils.hideKeyboard(context);
              return Future(() => false);
            } else {
              // Keyboard is not open, navigate back
              return Future(() => true);
            }
          },
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: dataTable45),
                child: SafeArea(
                  child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(size16),
                        topRight: Radius.circular(size16),
                      ),
                    ),
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      width: 400.0,
      content: Text(
        message,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static fullScreenImageView(BuildContext context, String imageUrl,
      {double? height, double? width}) {
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.90),
        anchorPoint: const Offset(10, 0),
        transitionBuilder: (context, a1, a2, widget) {
          return Center(
            child: SizedBox(
              height: height ?? 350,
              width: width ?? 310,
              child: Transform.scale(
                scale: a1.value,
                child: Opacity(
                  opacity: a1.value,
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    child: InteractiveViewer(
                      clipBehavior: Clip.none,
                      child: AspectRatio(
                        aspectRatio: 0.78,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .outlineVariant
                                .withOpacity(0.2),
                            border: Border.all(
                              color:
                                  Theme.of(context).colorScheme.outlineVariant,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(size16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(size16),
                            child: CachedNetworkImage(
                              imageUrl: imageUrl,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => const AppNoImage(),
                              errorWidget: (context, url, error) =>
                                  const AppNoImage(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        });
  }

  static popupOptionMenu(BuildContext context,
      {IconData? icon, String? title, void Function()? onPressed}) {
    return MenuItemButton(
      style: ButtonStyle(
          padding: WidgetStatePropertyAll(
              EdgeInsets.all(Utils.isWeb ? 20.0 : size12))),
      onPressed: onPressed,
      leadingIcon: Icon(icon),
      child: Text(title ?? "", style: Theme.of(context).textTheme.labelLarge),
    );
  }
}
