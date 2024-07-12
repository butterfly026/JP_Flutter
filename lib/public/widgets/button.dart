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
  final double paddingVertical;
  final double minWidth;
  final bool isFullToWidth;
  final bool disabled;

  Button(
      {this.text = '',
      this.onPressed,
      this.backgroundColor = AppTheme.mainDark,
      this.textColor = AppTheme.white,
      this.borderRadius = 4.0,
      this.minWidth = -1,
      this.paddingHorizontal = -1,
      this.paddingVertical = -1,
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
              vertical:
                  paddingVertical == -1 ? Dimens.gap_dp8 : paddingVertical,
              horizontal: paddingHorizontal == -1
                  ? Dimens.gap_dp12
                  : paddingHorizontal),
          child: Text(
            text,
            style: TextStyle(
              fontSize: Dimens.font_sp20,
              fontFamily: 'NotoSansJP',
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
            vertical: paddingVertical == -1 ? Dimens.gap_dp8 : paddingVertical,
            horizontal:
                paddingHorizontal == -1 ? Dimens.gap_dp12 : paddingHorizontal),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: Dimens.font_sp20,
              fontFamily: 'NotoSansJP',
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
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
              vertical:
                  paddingVertical == -1 ? Dimens.gap_dp18 : paddingVertical,
              horizontal: paddingHorizontal == -1
                  ? Dimens.gap_dp26
                  : paddingHorizontal),
          minimumSize: Size(minWidth != -1 ? minWidth : Dimens.gap_dp50, 30),
          backgroundColor:
              disabled ? AppTheme.buttonDisabledBack : backgroundColor,
          textStyle: TextStyle(color: textColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      onPressed: disabled ? null : onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: Dimens.font_sp20,
          fontFamily: 'NotoSansJP',
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
