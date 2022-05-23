import 'package:best_buy/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputDecorations {
  static InputDecoration addProductInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
    Color? iconColor,
  }) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Constants.primaryColor)),
        focusedBorder: const UnderlineInputBorder(
            borderSide:
                BorderSide(color: Constants.primaryColorShadow, width: 2)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: GoogleFonts.lato(
          textStyle: const TextStyle(color: Constants.primaryColorShadow),
        ),
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: iconColor) : null);
  }
}
