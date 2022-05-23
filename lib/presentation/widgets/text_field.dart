import 'package:best_buy/common/constants.dart';
import 'package:best_buy/common/responsive.dart';
import 'package:flutter/material.dart';

class TextFieldCustomized extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final void Function(String)? onChanged;
  final bool? obscureText;
  final bool? isSuffixIcon;
  final bool? isPrefixIcon;
  final void Function()? onTap;
  final bool? readOnly;
  final bool? otherColor;
  final Color? color;
  final int? maxLong;
  final void Function()? onSuffixIconTap;
  final bool? isMaxLong;
  final bool? isFilled;
  final TextEditingController? controller;
  final bool? isMyControllerActivate;
  TextInputType? keyboardType;
  final bool autocorrect;

  TextFieldCustomized({
    Key? key,
    this.hintText,
    this.prefixIconData,
    this.suffixIconData,
    this.onChanged,
    this.obscureText = false,
    this.isSuffixIcon = false,
    this.isPrefixIcon = false,
    this.onTap,
    this.readOnly = false,
    this.otherColor = false,
    this.color = Constants.primaryColor,
    this.maxLong = 50,
    this.onSuffixIconTap,
    this.isMaxLong = false,
    this.isFilled = false,
    this.controller,
    this.isMyControllerActivate = false,
    this.keyboardType,
    this.autocorrect = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSizeTextField = 0;

    if (isTab(context) || isDesktop(context)) {
      fontSizeTextField = 20;
    } else if (isMobile(context)) {
      fontSizeTextField = 12;
    }

    return TextFormField(
      maxLength: isMaxLong == false ? null : maxLong,
      controller: isMyControllerActivate == false ? null : controller,
      textInputAction: TextInputAction.done,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly!,
      obscureText: obscureText!,
      cursorColor: color,
      style: TextStyle(color: color, fontSize: fontSizeTextField),
      decoration: InputDecoration(
          labelStyle: TextStyle(color: color),
          focusColor: color,
          filled: isFilled,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: color!)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: color!)),
          labelText: hintText,
          prefixIcon: isPrefixIcon == false
              ? null
              : Icon(prefixIconData, size: 25, color: color),
          suffixIcon: isSuffixIcon == false
              ? null
              : GestureDetector(
                  onTap: onSuffixIconTap,
                  child: Icon(
                    suffixIconData,
                    size: 25,
                    color: color,
                  ),
                )),
    );
  }
}
