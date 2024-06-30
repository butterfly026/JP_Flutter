import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double paddingHorizontal;
  final double minWidth;
  final bool isFullToWidth;
  final bool disabled;

  Button(
      {this.text = '',
      this.onPressed,
      this.backgroundColor = AppTheme.mainDark,
      this.textColor = AppTheme.white,
      this.borderRadius = 4.0,
      this.minWidth = 0.0,
      this.paddingHorizontal = 0,
      this.disabled = false,
      this.isFullToWidth = false});
  Widget _getButtonContainer() {
    if (isFullToWidth) {
      return Container(
        constraints: BoxConstraints(
            minWidth: minWidth), // Adjust the minimum width as needed
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimens.gap_dp8, horizontal: paddingHorizontal == 0 ? Dimens.gap_dp12 : paddingHorizontal),
          child: Text(
            text,
            style: TextStyle(
              fontSize: Dimens.font_sp20,
              fontFamily: 'OpenSans',
              color: disabled ? AppTheme.buttonDisabledText : textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: minWidth), // Adjust the minimum width as needed
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimens.gap_dp8, horizontal: Dimens.gap_dp12),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: Dimens.font_sp20,
              fontFamily: 'OpenSans',
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(disabled ? AppTheme.buttonDisabledBack : backgroundColor),
          textStyle: WidgetStateProperty.all<TextStyle>(
            TextStyle(color: textColor),
          ),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          )),
      onPressed: disabled ? null : onPressed,
      child: _getButtonContainer(),
    );
  }
}
