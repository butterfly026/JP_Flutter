import 'package:flutter/material.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class Input extends StatelessWidget {
  final String placeholder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool autofocus;
  final Color borderColor;
  final bool isPassword;

  Input(
      {this.placeholder = '',
      this.suffixIcon,
      this.prefixIcon,
      this.onTap,
      this.onChanged,
      this.autofocus = false,
      this.isPassword = false,
      this.borderColor = AppTheme.mainGrey,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: AppTheme.mainDark,
        onTap: onTap,
        onChanged: onChanged,
        controller: controller,
        autofocus: autofocus,
        obscureText: isPassword,
        enableSuggestions: !isPassword,
        autocorrect: !isPassword,
        style: TextStyle(
            height: 1.0,
            fontSize: 14.0,
            color: AppTheme.mainDark,
            fontFamily: 'NotoSansJP'),
        // textAlignVertical: TextAlignVertical(y: 0.6),
        decoration: InputDecoration(
            filled: true,
            fillColor: AppTheme.white,
            hintStyle: TextStyle(
              color: AppTheme.mainGrey,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            hintText: placeholder));
  }
}
