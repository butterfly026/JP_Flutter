import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle headline1(BuildContext context, {int fontSize = 32}) {
    final appColors = Theme.of(context).extension<AppColors>();
    return TextStyle(
      fontSize: fontSize * 1.0,
      fontWeight: FontWeight.bold,
      color: appColors?.onBackground,
    );
  }

  static TextStyle headline2(BuildContext context, {int fontSize = 28}) {
    final appColors = Theme.of(context).extension<AppColors>();
    return TextStyle(
      fontSize: fontSize * 1.0,
      fontWeight: FontWeight.bold,
      color: appColors?.onBackground,
    );
  }

  static TextStyle bodyText1(BuildContext context, {int fontSize = 16}) {
    final appColors = Theme.of(context).extension<AppColors>();
    return TextStyle(
      fontSize: fontSize * 1.0,
      color: appColors?.onBackground,
    );
  }

  static TextStyle bodyText2(BuildContext context, {int fontSize = 14}) {
    final appColors = Theme.of(context).extension<AppColors>();
    return TextStyle(
      fontSize: fontSize * 1.0,
      color: appColors?.onBackground,
    );
  }
  // Add more text styles as needed
}
