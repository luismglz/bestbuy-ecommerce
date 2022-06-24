import 'dart:ui';

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

  static void displaySmallMessage(
      BuildContext context, String? message,
      {Color BackgroundColorCustom = Colors.redAccent}) {
    Flushbar(
      maxWidth: 150,
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      message: message!,
      duration: const Duration(seconds: 2),
      isDismissible: false,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: BackgroundColorCustom,
    ).show(context);
  }
}
