import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class MiniTextField extends StatefulWidget {
  final String hintText;
  final String value;
  final bool isPassword;
  const MiniTextField(
      {super.key,
      required this.hintText,
      required this.value,
      this.isPassword = false});
  @override
  _MiniTextFieldState createState() => _MiniTextFieldState();
}

class _MiniTextFieldState extends State<MiniTextField> {
  static void _defaultOnTap() {
    // Function body
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: Dimens.gap_dp10),
        child: TextField(
            style: AppTheme.body2,
            obscureText: widget.isPassword,
            enableSuggestions: !widget.isPassword,
            autocorrect: !widget.isPassword,
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              hintText: widget.hintText,
              fillColor: AppTheme.white,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: Dimens.gap_dp10, vertical: Dimens.gap_dp10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppTheme.lightGreyText,
                      width: 1.0,
                      style: BorderStyle.solid)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppTheme.lightGreyText,
                      width: 1.0,
                      style: BorderStyle.solid)),
            )));
  }
}
