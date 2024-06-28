import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';


class Button extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;

  Button({
    this.text = '',
    this.onPressed,
    this.backgroundColor = AppTheme.mainDark,
    this.textColor = AppTheme.white,
    this.borderRadius = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(color: textColor),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          )),
      onPressed: onPressed,
      child: Padding(
          padding:
              EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
          child: Text(text,
              style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'OpenSans',
                  color: textColor,
                  fontWeight: FontWeight.bold))),
    );
  }
}
