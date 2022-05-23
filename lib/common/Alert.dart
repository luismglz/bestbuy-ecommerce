import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class Alert {
  static void displayMessage(
      BuildContext context, String? message, String title,
      {Color BackgroundColorCustom = Colors.redAccent}) {
    Flushbar(
      title: title,
      message: message,
      duration: const Duration(seconds: 3),
      isDismissible: false,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      backgroundColor: BackgroundColorCustom,
    ).show(context);
  }
}
